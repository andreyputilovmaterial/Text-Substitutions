import re
from datetime import datetime
import argparse
from pathlib import Path
import codecs



def prepare_pattern(pattern_str,word_flag):
    if ';' in pattern_str:
        raise ValueError('pattern is not stupid enough!!!')
    return [ {'pattern':'{added_flag_beginning}{body}{added_flag_end}'.format(body=re.sub(r'^(.*?):(.*)$',lambda m: m[1],line),added_flag_beginning=r'\b' if word_flag else '',added_flag_end=r'\b' if word_flag else ''),'replacement':re.sub(r'^(.*?):(.*)$',lambda m: m[2],line)} for line in pattern_str.split(',') ]


def process(inp,patterns):
    result = inp
    for line in patterns:
        result = re.sub(line['pattern'],line['replacement'],result,flags=re.I|re.MULTILINE)
    return result


def detect_encoding(path, default='utf-8'):
    """Adapted from https://stackoverflow.com/questions/13590749/reading-unicode-file-data-with-bom-chars-in-python/24370596#24370596 """

    with open(path, 'rb') as f:
        raw = f.read(4)    # will read less if the file is smaller
    # BOM_UTF32_LE's start is equal to BOM_UTF16_LE so need to try the former first
    for enc, boms in \
            ('utf-8-sig', (codecs.BOM_UTF8,)), \
            ('utf-32', (codecs.BOM_UTF32_LE, codecs.BOM_UTF32_BE)), \
            ('utf-16', (codecs.BOM_UTF16_LE, codecs.BOM_UTF16_BE)):
        for bom in boms:
            if raw.startswith(bom):
                # return enc, bom
                return enc
    # return default, None
    return default




if __name__ == '__main__':

    time_start = datetime.now()
    script_name = 'mdmtoolsap diff script'

    parser = argparse.ArgumentParser(
        description="Replace text accurances in a list of files",
        prog='textsubstitutions'
    )
    parser.add_argument(
        '-1',
        '--file',
        help='Input text file to process',
        required=True
    )
    parser.add_argument(
        '-2',
        '--pattern',
        help='oldtext:newtext,olderanother:updatedreplacement,onemorematch:replacewiththis',
        required=False
    )
    parser.add_argument(
        '--wordmatch',
        help='adds "\\b" to regexps - searched pattern would only be matching exact word; for example, "DV_Banner1" will not match "DV_Banner13"',
        action='store_true',
        required=False
    )
    args = parser.parse_args()

    inp_filename = ''
    if args.file:
        inp_filename = Path(args.file)
        inp_filename = '{inp_filename}'.format(inp_filename=inp_filename.resolve())
    else:
        raise FileNotFoundError('Input file: file not provided; please use --file option')
    
    replacement_pattern = ''
    if args.pattern:
        replacement_pattern = args.pattern
    
    print('{script_name}: script started at {dt}'.format(dt=time_start,script_name=script_name))

    data = None
    #with open(inp_filename,'r',encoding='utf-8') as f:
    encoding = detect_encoding(inp_filename)
    with open(inp_filename,'r',encoding=encoding) as f:
        data = f.read()
        f.close()
    
    result = process( data, prepare_pattern(replacement_pattern,True if not not args.wordmatch else False) )

    out_filename = inp_filename

    print('{script_name}: saving as "{out_filename}"'.format(out_filename=out_filename,script_name=script_name))
    with open(out_filename, "w",encoding=encoding) as outfile:
        outfile.write(result)

    time_finish = datetime.now()
    print('{script_name}: finished at {dt} (elapsed {duration})'.format(dt=time_finish,duration=time_finish-time_start,script_name=script_name))
