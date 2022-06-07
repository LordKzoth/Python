from elftools.elf.elffile import ELFFile
from elftools.elf.relocation import RelocationSection
from capstone import *

"""
This code have 3 Sections:
    - Get information about sections in program
    - Create dictionary {'symbolic reference': symbolic definition}
"""

with open('./start', 'rb') as file:
    elf  = ELFFile(file)
    
    # SECTION 1
    # Print all present sections (and it's content)
    print('ALL SECTIONS:')
    for section in elf.iter_sections():
        print(f'{hex(section["sh_addr"])}\t{section.name}')
    
    # SECTION 2
    # !!! COMPLETE IT WITH USING OTHER FILE
    print('\n=======================================================\n')
    symb_definitions = dict()
    for section in elf.iter_sections():
        if isinstance(section, RelocationSection):
            print(f'{section.name}')
                        
            symbolic_table = elf.get_section(section['sh_link'])
            for relocation in section.iter_relocations():
                symbol = symbolic_table.get_symbol(relocation['r_info_sym'])
                addr   = hex(relocation['r_offset'])

                print(f'{symbol.name}\t{addr}')
    
    # SECTION 3
    # Disassembly .text section
    print('\n=======================================================\n')
    print('.text CONTENT:')
    code = elf.get_section_by_name('.text')
        
    ops  = code.data()
    addr = code['sh_addr']

    md = Cs(CS_ARCH_X86, CS_MODE_32)

    for i in md.disasm(ops, addr):
        print(f'0x{i.address:x}:\t{i.mnemonic}\t{i.op_str}')
