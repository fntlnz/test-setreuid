.PHONY: test


test:
	gcc -static -o test main.c
	docker build -t test-setreuid .
	@echo ""
	@echo "Trying with the default seccomp profile"
	@echo ""
	docker run --rm test-setreuid 10
	@echo ""
	@echo "Trying witout the setreuid syscalls"
	@echo ""
	docker run --security-opt seccomp=secprof.json --rm test-setreuid 10
	@echo ""
	docker rmi test-setreuid
