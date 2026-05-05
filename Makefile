GENERATED_ACT := src/sw_adapter_cisco_ios_cli_model.act
GEN_ADATA_INPUTS := src/sw_adapter_cisco_ios_cli_yang.act

.PHONY: build
build: $(GENERATED_ACT)
	acton build $(DEP_OVERRIDES)

.PHONY: gen
gen: $(GENERATED_ACT)

$(GENERATED_ACT): gen_adata/out/bin/gen_adata $(GEN_ADATA_INPUTS)
	@if [ ! -f "$@" ] || [ "$@" -ot gen_adata/out/bin/gen_adata ] || [ "$@" -ot src/sw_adapter_cisco_ios_cli_yang.act ]; then \
		gen_adata/out/bin/gen_adata; \
	fi

gen_adata/out/bin/gen_adata: gen_adata/src/gen_adata.act $(GEN_ADATA_INPUTS)
	cp -a src/sw_adapter_cisco_ios_cli_yang.act gen_adata/src/sw_adapter_cisco_ios_cli_yang.act
	cd gen_adata && acton build $(subst ../,../../,$(DEP_OVERRIDES))

.PHONY: test
test: $(GENERATED_ACT)
	acton test $(DEP_OVERRIDES)
