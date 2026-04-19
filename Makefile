SOURCES=rv32_*.py
ESSENTIALS=testcase0.out.s testcase0-noalias.out.s
TESTS=$(ESSENTIALS) godot.out.s core_matrix.out.s core_matrix_O2.out.s

essentials: $(ESSENTIALS)

all: $(TESTS)

clean:
	rm -f *.out.s

%.out.s: %.s $(SOURCES)
	python ./rv32_scheduler.py -j0 --wide-dual-arith --same-base-reorder $< > $@

%.tally: %.out.s $(SOURCES)
	python ./rv32_tally.py $< | tee $@

%.unpaired.s: %.out.s
	sed "s/^.*# PAIR.*$$/----/" < $< | uniq > $@

%.s: %.objdump rv32_objdump.py
	python ./rv32_objdump.py $< > $@
