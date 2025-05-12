# .PHONY: all run clean

# run:
# 	@echo "Sourcing prelaunch and launching..."
# 	. ./scripts/prelaunch.sh && ./scripts/main_launch.sh

# clean:
# 	@echo "Cleaning up..."
# 	rm -rf __pycache__ *.log


.PHONY: all run clean

run:
	@echo "Sourcing prelaunch and launching with controller: $(CTRL)..."
	CTRL=$(CTRL) ./scripts/main_launch.sh

clean:
	@echo "Cleaning up..."
	rm -rf __pycache__ *.log
