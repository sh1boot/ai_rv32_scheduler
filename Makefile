SOURCES=rv32_scheduler.py rv32_core.py rv32_scorers.py
ESSENTIALS=homebrew-qemu.out.s homebrew-qemu.noalias.out.s
TESTS=$(ESSENTIALS) core_matrix.out.s core_matrix_O2.out.s

essentials: $(ESSENTIALS)

all: $(TESTS)

clean:
	rm -f *.out.s

%.out.s: %.s $(SOURCES)
	python ./rv32_scheduler.py --opcode-tally $< > $@

%.s: %.objdump rv32_objdump.py
	python ./rv32_objdump.py $< > $@
