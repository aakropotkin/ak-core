# -*- mode: m4; -*-
# ============================================================================ #
#
#
# ---------------------------------------------------------------------------- #

m4_define([_CO_REJECT_NEGATIVE_OPTS],
          [-fwpa= dnl
           -symbol= dnl
           -dump-level= dnl
           -dump-body= dnl
           -fbounds-check= dnl
           -fdebug= dnl
           -fdoc-dir= dnl
           -fdoc-file= dnl
           -fdoc-inc= dnl
           -fmain dnl
           -fmodule-file= dnl
           -fonly= dnl
           -ftransition=all dnl
           -ftransition=complex dnl
           -ftransition=dip1000 dnl
           -ftransition=dip25 dnl
           -ftransition=field dnl
           -ftransition=nogc dnl
           -ftransition=tls dnl
           -fversion= dnl
           -W dnl
           -Wa, dnl
           -Wl, dnl
           -Wp, dnl
           -Warray-bounds= dnl
           -Wattribute-alias= dnl
           -Wframe-larger-than= dnl
           -Wimplicit-fallthrough= dnl
           -Wlarger-than- dnl
           -Wlarger-than= dnl
           -Wstack-usage= dnl
           -Wstrict-aliasing= dnl
           -Wstrict-overflow= dnl
           -fabi-version= dnl
           -falign-functions= dnl
           -falign-jumps= dnl
           -falign-labels= dnl
           -falign-loops= dnl
           -fsanitize-coverage= dnl
           -fasan-shadow-offset= dnl
           -fsanitize-sections= dnl
           -fauto-profile= dnl
           -fcallgraph-info dnl
           -fcallgraph-info= dnl
           -fcall-saved- dnl
           -fcall-used- dnl
           -fchecking= dnl
           -fcompare-debug= dnl
           -fcompare-debug-second dnl
           -fdbg-cnt= dnl
           -fdebug-prefix-map= dnl
           -ffile-prefix-map= dnl
           -fdiagnostics-show-location= dnl
           -fdiagnostics-color= dnl
           -fdiagnostics-urls= dnl
           -fdiagnostics-column-unit= dnl
           -fdiagnostics-column-origin= dnl
           -fdiagnostics-format= dnl
           -fdiagnostics-path-format= dnl
           -fdiagnostics-plain-output dnl
           -ftabstop= dnl
           -fdisable- dnl
           -fenable- dnl
           -fdump- dnl
           -fdump-final-insns dnl
           -fdump-final-insns= dnl
           -fdump-go-spec= dnl
           -fexcess-precision= dnl
           -fpermitted-flt-eval-methods= dnl
           -ffixed- dnl
           -ffp-contract= dnl
           -fgnat-encodings= dnl
           -fstack-reuse= dnl
           -finline-limit- dnl
           -finline-limit= dnl
           -fcf-protection dnl
           -fcf-protection= dnl
           -finstrument-functions-exclude-function-list= dnl
           -finstrument-functions-exclude-file-list= dnl
           -fira-algorithm= dnl
           -fira-region= dnl
           -fira-verbose= dnl
           -flto= dnl
           -flto-partition= dnl
           -flto-compression-level= dnl
           -fmax-errors= dnl
           -fmessage-length= dnl
           -foffload-abi= dnl
           -fopt-info- dnl
           -fpack-struct= dnl
           -fplugin= dnl
           -fplugin-arg- dnl
           -fprofile-dir= dnl
           -fprofile-note= dnl
           -fprofile-update= dnl
           -fprofile-filter-files= dnl
           -fprofile-exclude-files= dnl
           -fprofile-reproducible= dnl
           -fprofile-prefix-path= dnl
           -fprofile-generate= dnl
           -fprofile-info-section dnl
           -fprofile-info-section= dnl
           -fprofile-use= dnl
           -frandom-seed= dnl
           -flifetime-dse= dnl
           -flive-patching dnl
           -flive-patching= dnl
           -freorder-blocks-algorithm= dnl
           -fsched-verbose= dnl
           -fsched-stalled-insns= dnl
           -fsched-stalled-insns-dep= dnl
           -fstack-check= dnl
           -fstack-limit-register= dnl
           -fstack-limit-symbol= dnl
           -fstack-protector-all dnl
           -fstack-protector-strong dnl
           -fstack-protector-explicit dnl
           -fstack-usage dnl
           -ftls-model= dnl
           -ftree-coalesce-inlined-vars dnl
           -ftree-parallelize-loops= dnl
           -ftree-vectorizer-verbose= dnl
           -fvect-cost-model= dnl
           -fsimd-cost-model= dnl
           -ftrivial-auto-var-init= dnl
           -fvisibility= dnl
           -fvtable-verify= dnl
           -fzero-call-used-regs= dnl
           -g dnl
           -gctf dnl
           -gbtf dnl
           -gdwarf32 dnl
           -gdwarf64 dnl
           -gno- dnl
           -gvariable-location-views=incompat5 dnl
           -gz= dnl
           -shared dnl
           -no-pie dnl
           -pie dnl
           -static-pie dnl
           -fdump-scos dnl
           -nostdinc dnl
           -fRTS= dnl
           -gant dnl
           -gnatO dnl
           -gnat dnl
           -fall-intrinsics dnl
           -fallow-invalid-boz dnl
           -fblas-matmul-limit= dnl
           -fconvert= dnl
           -fd-lines-as-code dnl
           -fd-lines-as-comments dnl
           -ffixed-form dnl
           -finteger-4-integer-8 dnl
           -fintrinsic-modules-path dnl
           -fintrinsic-modules-path= dnl
           -ffixed-line-length-none dnl
           -ffixed-line-length- dnl
           -ffpe-trap= dnl
           -ffpe-summary= dnl
           -ffree-form dnl
           -ffree-line-length-none dnl
           -ffree-line-length- dnl
           -finit-character= dnl
           -finit-integer= dnl
           -finit-logical= dnl
           -finit-real= dnl
           -finline-matmul-limit= dnl
           -fmax-array-constructor= dnl
           -fmax-identifier-length= dnl
           -fmax-subrecord-length= dnl
           -fmax-stack-var-size= dnl
           -fpre-include= dnl
           -freal-4-real-8 dnl
           -freal-4-real-10 dnl
           -freal-4-real-16 dnl
           -freal-8-real-4 dnl
           -freal-8-real-10 dnl
           -freal-8-real-16 dnl
           -frecord-marker=4 dnl
           -frecord-marker=8 dnl
           -fcoarray= dnl
           -fcheck= dnl
           -ftail-call-workaround= dnl
           -fanalyzer-checker= dnl
           -fdump-analyzer dnl
           -fdump-analyzer-stderr dnl
           -fdump-analyzer-callgraph dnl
           -fdump-analyzer-exploded-graph dnl
           -fdump-analyzer-exploded-nodes dnl
           -fdump-analyzer-exploded-nodes-2 dnl
           -fdump-analyzer-exploded-nodes-3 dnl
           -fdump-analyzer-exploded-paths dnl
           -fdump-analyzer-feasibility dnl
           -fdump-analyzer-json dnl
           -fdump-analyzer-state-purge dnl
           -fdump-analyzer-supergraph dnl
           -Wabi= dnl
           -Waligned-new= dnl
           -Warray-parameter= dnl
           -Wcatch-value= dnl
           -Werror-implicit-function-declaration dnl
           -Wformat= dnl
           -Wformat-overflow= dnl
           -Wformat-truncation= dnl
           -Wstringop-overflow= dnl
           -Wnormalized= dnl
           -Wplacement-new= dnl
           -Wshift-overflow= dnl
           -Wunused-const-variable= dnl
           -fabi-compat-version= dnl
           -fada-spec-parent= dnl
           -faligned-new= dnl
           -fchkp-first-field-has-own-bounds dnl
           -fchkp-narrow-to-innermost-array dnl
           -fconcepts-diagnostics-depth= dnl
           -fconstexpr-depth= dnl
           -fconstexpr-cache-depth= dnl
           -fconstexpr-loop-limit= dnl
           -fconstexpr-ops-limit= dnl
           -fmacro-prefix-map= dnl
           -fdump-ada-spec dnl
           -fdump-ada-spec-slim dnl
           -fexec-charset= dnl
           -finput-charset= dnl
           -fgnu-runtime dnl
           -fno-modules dnl
           -fmodule-header dnl
           -fmodule-header= dnl
           -fmodule-only dnl
           -fmodule-mapper= dnl
           -flang-info-include-translate= dnl
           -flang-info-module-cmi= dnl
           -fmax-include-depth= dnl
           -fnext-runtime dnl
           -fivar-visibility= dnl
           -fobjc-abi-version= dnl
           -ftrack-macro-expansion dnl
           -ftrack-macro-expansion= dnl
           -fsso-struct= dnl
           -fstrong-eval-order= dnl
           -ftemplate-backtrace-limit= dnl
           -ftemplate-depth- dnl
           -ftemplate-depth= dnl
           -fwide-exec-charset= dnl
           -gen-decls dnl
           -stdlib= dnl
           -mlegacy-threads dnl
           -mshared dnl
           -mthreads dnl
           -march= dnl
           -mcpu= dnl
           -mno-crt0 dnl
           -maix64 dnl
           -maix32 dnl
           -mcmodel= dnl
           -mpe dnl
           -ffix-and-continue dnl
           -findirect-data dnl
           -m64 dnl
           -m32 dnl
           -mpowerpc dnl
           -mno-mfpgpr dnl
           -mmfpgpr dnl
           -mno-string dnl
           -mstring dnl
           -msoft-float dnl
           -mhard-float dnl
           -mveclibabi= dnl
           -mno-update dnl
           -mupdate dnl
           -maix-struct-return dnl
           -msvr4-struct-return dnl
           -mrecip= dnl
           -mno-fp-in-toc dnl
           -mfp-in-toc dnl
           -mno-sum-in-toc dnl
           -msum-in-toc dnl
           -mvrsave=no dnl
           -mvrsave=yes dnl
           -mblock-move-inline-limit= dnl
           -mblock-compare-inline-limit= dnl
           -mblock-compare-inline-loop-limit= dnl
           -mstring-compare-inline-limit= dnl
           -mdebug= dnl
           -mabi=altivec dnl
           -mabi=no-altivec dnl
           -mabi=vec-extabi dnl
           -mabi=vec-default dnl
           -mabi=elfv1 dnl
           -mabi=elfv2 dnl
           -mabi=d64 dnl
           -mabi=d32 dnl
           -mabi=ieeelongdouble dnl
           -mabi=ibmlongdouble dnl
           -mcpu= dnl
           -mtune= dnl
           -mtraceback= dnl
           -mgen-cell-microcode dnl
           -mlong-double- dnl
           -mlra dnl
           -msched-costly-dep= dnl
           -minsert-sched-nops= dnl
           -malign- dnl
           -mprioritize-restricted-insns= dnl
           -mvsx-timode dnl
           -mstack-protector-guard= dnl
           -mstack-protector-guard-reg= dnl
           -mstack-protector-guard-offset= dnl
           -mcall- dnl
           -msdata= dnl
           -mtls-size= dnl
           -mlittle-endian dnl
           -mlittle dnl
           -mbig-endian dnl
           -mbig dnl
           -mno-toc dnl
           -mtoc dnl
           -mno-traceback dnl
           -msim dnl
           -mads dnl
           -myellowknife dnl
           -mmvme dnl
           -memb dnl
           -mshlib dnl
           -m64 dnl
           -m32 dnl
           -mnewlib dnl
           -msecure-plt dnl
           -mbss-plt dnl
           -mcmodel= dnl
           -mno-data-in-code dnl
           -mcode-xonly dnl
           -mabi= dnl
           -march= dnl
           -mbranch-cost= dnl
           -mcode-readable= dnl
           -mdivide-breaks dnl
           -mdivide-traps dnl
           -mdmx dnl
           -mdouble-float dnl
           -meb dnl
           -mel dnl
           -mfp32 dnl
           -mfpxx dnl
           -mfp64 dnl
           -mflush-func= dnl
           -mabs= dnl
           -mnan= dnl
           -mgp32 dnl
           -mgp64 dnl
           -mhard-float dnl
           -mips dnl
           -mips16 dnl
           -mips3d dnl
           -mlong32 dnl
           -mlong64 dnl
           -mno-float dnl
           -mno-flush-func dnl
           -mno-mdmx dnl
           -mno-mips16 dnl
           -mno-mips3d dnl
           -mr10k-cache-barrier= dnl
           -msingle-float dnl
           -msoft-float dnl
           -mtune= dnl
           -mcompact-branches= dnl
           -macc-4 dnl
           -macc-8 dnl
           -malloc-cc dnl
           -mbranch-cost= dnl
           -mcond-exec-insns= dnl
           -mcond-exec-temps= dnl
           -mcpu= dnl
           -mfixed-cc dnl
           -mfpr-32 dnl
           -mfpr-64 dnl
           -mgpr-32 dnl
           -mgpr-64 dnl
           -mhard-float dnl
           -mno-eflags dnl
           -msched-lookahead= dnl
           -msoft-float dnl
           -mTLS dnl
           -mtls dnl
           -multilib-library-pic dnl
           -mieee-conformant dnl
           -mieee dnl
           -mieee-with-inexact dnl
           -mfloat-vax dnl
           -mfloat-ieee dnl
           -msmall-data dnl
           -mlarge-data dnl
           -msmall-text dnl
           -mlarge-text dnl
           -mlong-double-128 dnl
           -mlong-double-64 dnl
           -mcpu= dnl
           -mtune= dnl
           -mfp-rounding-mode= dnl
           -mfp-trap-mode= dnl
           -mtrap-precision= dnl
           -mmemory-latency= dnl
           -mtls-size= dnl
           -m10 dnl
           -mdec-asm dnl
           -mgnu-asm dnl
           -mfpu dnl
           -msoft-float dnl
           -munix-asm dnl
           -iframework dnl
           -mmacosx-version-min= dnl
           -mone-byte-bool dnl
           -mtarget-linker= dnl
           -mtarget-linker dnl
           -all_load dnl
           -allowable_client dnl
           -arch dnl
           -arch_errors_fatal dnl
           -asm_macosx_version_min= dnl
           -bind_at_load dnl
           -bundle dnl
           -bundle_loader dnl
           -client_name dnl
           -compatibility_version dnl
           -current_version dnl
           -dead_strip dnl
           -dylinker dnl
           -dylinker_install_name dnl
           -dynamic dnl
           -dynamiclib dnl
           -exported_symbols_list dnl
           -filelist dnl
           -findirect-virtual-calls dnl
           -flat_namespace dnl
           -force_cpusubtype_ALL dnl
           -force_flat_namespace dnl
           -framework dnl
           -fterminated-vtables dnl
           -gfull dnl
           -gused dnl
           -headerpad_max_install_names dnl
           -image_base dnl
           -init dnl
           -install_name dnl
           -keep_private_externs dnl
           -multi_module dnl
           -multiply_defined dnl
           -multiply_defined_unused dnl
           -no_dead_strip_inits_and_terms dnl
           -nofixprebinding dnl
           -nomultidefs dnl
           -noprebind dnl
           -noseglinkedit dnl
           -object dnl
           -pagezero_size dnl
           -prebind dnl
           -prebind_all_twolevel_modules dnl
           -preload dnl
           -private_bundle dnl
           -pthread dnl
           -rdynamic dnl
           -read_only_relocs dnl
           -sectalign dnl
           -sectcreate dnl
           -sectobjectsymbols dnl
           -sectorder dnl
           -seg_addr_table dnl
           -seg_addr_table_filename dnl
           -seg1addr dnl
           -segaddr dnl
           -segcreate dnl
           -seglinkedit dnl
           -segprot dnl
           -segs_read_only_addr dnl
           -segs_read_write_addr dnl
           -single_module dnl
           -sub_library dnl
           -sub_umbrella dnl
           -twolevel_namespace dnl
           -twolevel_namespace_hints dnl
           -umbrella dnl
           -undefined dnl
           -unexported_symbols_list dnl
           -weak_reference_mismatches dnl
           -whatsloaded dnl
           -whyload dnl
           -X dnl
           -y dnl
           -Mach dnl
           -mabi= dnl
           -mapcs dnl
           -march= dnl
           -mlibarch= dnl
           -marm dnl
           -mbig-endian dnl
           -mcpu= dnl
           -mfloat-abi= dnl
           -mcmse dnl
           -mfp16-format= dnl
           -mfpu= dnl
           -mhard-float dnl
           -mlittle-endian dnl
           -mpic-register= dnl
           -msoft-float dnl
           -mstructure-size-boundary= dnl
           -mthumb dnl
           -mtls-dialect= dnl
           -mtp= dnl
           -mtune= dnl
           -mprint-tune-info dnl
           -mvectorize-with-neon-quad dnl
           -mvectorize-with-neon-double dnl
           -mbe8 dnl
           -mbe32 dnl
           -mbranch-cost= dnl
           -mgeneral-regs-only dnl
           -mbig-endian dnl
           -mlittle-endian dnl
           -msim dnl
           -msdata= dnl
           -march= dnl
           -m64bit-doubles dnl
           -m32bit-doubles dnl
           -nofpu dnl
           -mnofpu dnl
           -fpu dnl
           -mcpu= dnl
           -mbig-endian-data dnl
           -mlittle-endian-data dnl
           -msmall-data-limit= dnl
           -mmax-constant-size= dnl
           -mint-register= dnl
           -mgcc-abi dnl
           -mrx-abi dnl
           -mint-register= dnl
           -m210 dnl
           -m340 dnl
           -mbig-endian dnl
           -mlittle-endian dnl
           -mno-lsim dnl
           -mstack-increment= dnl
           -mdebug dnl
           -msim dnl
           -mhard-float dnl
           -msoft-float dnl
           -mcpu= dnl
           -mtune= dnl
           -msv-mode dnl
           -muser-mode dnl
           -menable-trampolines dnl
           -mkernel= dnl
           -mbig-endian dnl
           -mlittle-endian dnl
           -mframe-limit= dnl
           -mcpu= dnl
           -m31 dnl
           -m64 dnl
           -march= dnl
           -mesa dnl
           -mhard-float dnl
           -mhotpatch= dnl
           -mlong-double-128 dnl
           -mlong-double-64 dnl
           -msoft-float dnl
           -mstack-guard= dnl
           -mno-stack-guard dnl
           -mstack-size= dnl
           -mno-stack-size dnl
           -mtune= dnl
           -mwarn-framesize= dnl
           -mzarch dnl
           -mbranch-cost= dnl
           -mindirect-branch= dnl
           -mindirect-branch-jump= dnl
           -mindirect-branch-call= dnl
           -mfunction-return= dnl
           -mfunction-return-mem= dnl
           -mfunction-return-reg= dnl
           -mtpf-trace-hook-prologue-check= dnl
           -mtpf-trace-hook-prologue-target= dnl
           -mtpf-trace-hook-epilogue-check= dnl
           -mtpf-trace-hook-epilogue-target= dnl
           -mtune= dnl
           -mno-crt0 dnl
           -mrelax dnl
           -mbig-endian dnl
           -mgeneral-regs-only dnl
           -mharden-sls= dnl
           -mlittle-endian dnl
           -mcmodel= dnl
           -mtls-dialect= dnl
           -mtls-size= dnl
           -march= dnl
           -mcpu= dnl
           -mtune= dnl
           -mabi= dnl
           -moverride= dnl
           -mbranch-protection= dnl
           -msign-return-address= dnl
           -msve-vector-bits= dnl
           -mstack-protector-guard= dnl
           -mstack-protector-guard-reg= dnl
           -mstack-protector-guard-offset= dnl
           -mint32 dnl
           -maddresses dnl
           -mslowbyte dnl
           -mrelax dnl
           -malign-300 dnl
           -mcpu=r8c dnl
           -mcpu=m16c dnl
           -mcpu=m32cm dnl
           -mcpu=m32c dnl
           -memregs= dnl
           -mbig-endian dnl
           -mlittle-endian dnl
           -mbranch-cost= dnl
           -mabi= dnl
           -mpreferred-stack-boundary= dnl
           -march= dnl
           -mtune= dnl
           -mcpu= dnl
           -mcmodel= dnl
           -malign-data= dnl
           -mstack-protector-guard= dnl
           -mstack-protector-guard-reg= dnl
           -mstack-protector-guard-offset= dnl
           -misa-spec= dnl
           -mbranch-cost= dnl
           -mnops= dnl
           -mstack-offset= dnl
           -mfp-mode= dnl
           -max-vect-align= dnl
           -m1reg- dnl
           -mdebug-addr dnl
           -mdata-model= dnl
           -mcr16c dnl
           -mcr16cplus dnl
           -mint32 dnl
           -msoft-float dnl
           -mhard-float dnl
           -mcpu= dnl
           -mbig-endian dnl
           -mlittle-endian dnl
           -mno-clearbss dnl
           -m5200 dnl
           -m5206e dnl
           -m528x dnl
           -m5307 dnl
           -m5407 dnl
           -m68000 dnl
           -m68010 dnl
           -m68020 dnl
           -m68020-40 dnl
           -m68020-60 dnl
           -m68030 dnl
           -m68040 dnl
           -m68060 dnl
           -m68302 dnl
           -m68332 dnl
           -m68881 dnl
           -march= dnl
           -mc68000 dnl
           -mc68020 dnl
           -mcfv4e dnl
           -mcpu= dnl
           -mcpu32 dnl
           -mfidoa dnl
           -mhard-float dnl
           -mlong-jump-table-offsets dnl
           -mnobitfield dnl
           -mnortd dnl
           -mnoshort dnl
           -mshared-library-id= dnl
           -msoft-float dnl
           -mtune= dnl
           -mieee-fp dnl
           -mabi=call0 dnl
           -mabi=windowed dnl
           -melf dnl
           -metrax100 dnl
           -mno-etrax100 dnl
           -mside-effects dnl
           -mno-side-effects dnl
           -mstack-align dnl
           -mno-stack-align dnl
           -mdata-align dnl
           -mno-data-align dnl
           -mconst-align dnl
           -mno-const-align dnl
           -m32-bit dnl
           -m32bit dnl
           -m16-bit dnl
           -m16bit dnl
           -m8-bit dnl
           -m8bit dnl
           -mprologue-epilogue dnl
           -mno-prologue-epilogue dnl
           -mbest-lib-options dnl
           -moverride-best-lib-options dnl
           -mcpu= dnl
           -march= dnl
           -mtune= dnl
           -mmax-stackframe= dnl
           -max-stackframe= dnl
           -march=1.0 dnl
           -march=1.1 dnl
           -march=2.0 dnl
           -mfixed-range= dnl
           -mlinker-opt dnl
           -mnosnake dnl
           -mno-space-regs dnl
           -mpa-risc-1-0 dnl
           -mpa-risc-1-1 dnl
           -mpa-risc-2-0 dnl
           -mschedule= dnl
           -msnake dnl
           -mspace-regs dnl
           -munix=2003 dnl
           -msio dnl
           -munix=93 dnl
           -mwsio dnl
           -munix=98 dnl
           -munix=95 dnl
           -mgnu-ld dnl
           -mhp-ld dnl
           -m32 dnl
           -m64 dnl
           -mmainkernel dnl
           -msoft-stack-reserve-local= dnl
           -misa= dnl
           -mptx= dnl
           -march= dnl
           -mcpu= dnl
           -mbig-endian dnl
           -EB dnl
           -mlittle-endian dnl
           -EL dnl
           -mhard-float dnl
           -msoft-float dnl
           -mfloat-abi=v2 dnl
           -mfloat-abi=v1 dnl
           -mfloat-abi= dnl
           -mfpu= dnl
           -mmp dnl
           -mcp dnl
           -mcache dnl
           -msecurity dnl
           -mmac dnl
           -mtrust dnl
           -mdsp dnl
           -medsp dnl
           -mvdsp dnl
           -mbranch-cost= dnl
           -mmul= dnl
           -mcpu= dnl
           -mg10 dnl
           -mg13 dnl
           -mg14 dnl
           -mrl78 dnl
           -mt dnl
           -mabi=mmixware dnl
           -mabi=gnu dnl
           -mno-set-program-start dnl
           -melf dnl
           -mbranch-predict dnl
           -mno-branch-predict dnl
           -mbase-addresses dnl
           -mno-base-addresses dnl
           -msingle-exit dnl
           -mno-single-exit dnl
           -mset-program-start= dnl
           -mset-data-start= dnl
           -mhard-div dnl
           -msoft-div dnl
           -mhard-mul dnl
           -msoft-mul dnl
           -msoft-float dnl
           -mhard-float dnl
           -munordered-float dnl
           -mcmodel= dnl
           -mcmov dnl
           -mror dnl
           -mrori dnl
           -msext dnl
           -msfimm dnl
           -mshftimm dnl
           -mboard= dnl
           -mnewlib dnl
           -mno-asm-pic dnl
           -md dnl
           -md-float dnl
           -mg dnl
           -mg-float dnl
           -mgnu dnl
           -munix dnl
           -mvaxc-alignment dnl
           -mrtp dnl
           -mvthreads dnl
           -meb dnl
           -mel dnl
           -mno-crt0 dnl
           -mno-lsim dnl
           -m128bit-long-double dnl
           -m96bit-long-double dnl
           -mlong-double-80 dnl
           -mlong-double-64 dnl
           -mlong-double-128 dnl
           -malign-functions= dnl
           -malign-jumps= dnl
           -malign-loops= dnl
           -malign-stringops dnl
           -malign-data= dnl
           -march= dnl
           -masm= dnl
           -mbranch-cost= dnl
           -mlarge-data-threshold= dnl
           -mcmodel= dnl
           -maddress-mode= dnl
           -mcpu= dnl
           -mfancy-math-387 dnl
           -mfpmath= dnl
           -mhard-float dnl
           -mno-align-stringops dnl
           -mno-fancy-math-387 dnl
           -mno-push-args dnl
           -mno-red-zone dnl
           -mpc32 dnl
           -mpc64 dnl
           -mpc80 dnl
           -mpreferred-stack-boundary= dnl
           -mincoming-stack-boundary= dnl
           -mred-zone dnl
           -mregparm= dnl
           -msseregparm dnl
           -mmemcpy-strategy= dnl
           -mmemset-strategy= dnl
           -mstringop-strategy= dnl
           -mtls-dialect= dnl
           -mtune= dnl
           -mtune-ctrl= dnl
           -mno-default dnl
           -mdump-tune-features dnl
           -mabi= dnl
           -mveclibabi= dnl
           -mrecip= dnl
           -mdispatch-scheduler dnl
           -mprefer-vector-width= dnl
           -m32 dnl
           -m64 dnl
           -mx32 dnl
           -m16 dnl
           -msse4 dnl
           -mno-sse4 dnl
           -mfentry-name= dnl
           -mfentry-section= dnl
           -mstack-protector-guard= dnl
           -mstack-protector-guard-reg= dnl
           -mstack-protector-guard-offset= dnl
           -mstack-protector-guard-symbol= dnl
           -mgeneral-regs-only dnl
           -mindirect-branch= dnl
           -mfunction-return= dnl
           -minstrument-return= dnl
           -mconsole dnl
           -mdll dnl
           -mthreads dnl
           -msim dnl
           -mcpu= dnl
           -mshared-library-id= dnl
           -mbionic dnl
           -mglibc dnl
           -muclibc dnl
           -mmusl dnl
           -msmallc dnl
           -msys-lib= dnl
           -msys-crt0= dnl
           -mhal dnl
           -mno-cache-volatile dnl
           -mcache-volatile dnl
           -mgpopt= dnl
           -mgpopt dnl
           -mno-gpopt dnl
           -meb dnl
           -mel dnl
           -mcustom-fpu-cfg= dnl
           -mno-custom-ftruncds dnl
           -mcustom-ftruncds= dnl
           -mno-custom-fextsd dnl
           -mcustom-fextsd= dnl
           -mno-custom-fixdu dnl
           -mcustom-fixdu= dnl
           -mno-custom-fixdi dnl
           -mcustom-fixdi= dnl
           -mno-custom-fixsu dnl
           -mcustom-fixsu= dnl
           -mno-custom-fixsi dnl
           -mcustom-fixsi= dnl
           -mno-custom-floatud dnl
           -mcustom-floatud= dnl
           -mno-custom-floatid dnl
           -mcustom-floatid= dnl
           -mno-custom-floatus dnl
           -mcustom-floatus= dnl
           -mno-custom-floatis dnl
           -mcustom-floatis= dnl
           -mno-custom-fcmpned dnl
           -mcustom-fcmpned= dnl
           -mno-custom-fcmpeqd dnl
           -mcustom-fcmpeqd= dnl
           -mno-custom-fcmpged dnl
           -mcustom-fcmpged= dnl
           -mno-custom-fcmpgtd dnl
           -mcustom-fcmpgtd= dnl
           -mno-custom-fcmpled dnl
           -mcustom-fcmpled= dnl
           -mno-custom-fcmpltd dnl
           -mcustom-fcmpltd= dnl
           -mno-custom-flogd dnl
           -mcustom-flogd= dnl
           -mno-custom-fexpd dnl
           -mcustom-fexpd= dnl
           -mno-custom-fatand dnl
           -mcustom-fatand= dnl
           -mno-custom-ftand dnl
           -mcustom-ftand= dnl
           -mno-custom-fsind dnl
           -mcustom-fsind= dnl
           -mno-custom-fcosd dnl
           -mcustom-fcosd= dnl
           -mno-custom-fsqrtd dnl
           -mcustom-fsqrtd= dnl
           -mno-custom-fabsd dnl
           -mcustom-fabsd= dnl
           -mno-custom-fnegd dnl
           -mcustom-fnegd= dnl
           -mno-custom-fmaxd dnl
           -mcustom-fmaxd= dnl
           -mno-custom-fmind dnl
           -mcustom-fmind= dnl
           -mno-custom-fdivd dnl
           -mcustom-fdivd= dnl
           -mno-custom-fmuld dnl
           -mcustom-fmuld= dnl
           -mno-custom-fsubd dnl
           -mcustom-fsubd= dnl
           -mno-custom-faddd dnl
           -mcustom-faddd= dnl
           -mno-custom-fcmpnes dnl
           -mcustom-fcmpnes= dnl
           -mno-custom-fcmpeqs dnl
           -mcustom-fcmpeqs= dnl
           -mno-custom-fcmpges dnl
           -mcustom-fcmpges= dnl
           -mno-custom-fcmpgts dnl
           -mcustom-fcmpgts= dnl
           -mno-custom-fcmples dnl
           -mcustom-fcmples= dnl
           -mno-custom-fcmplts dnl
           -mcustom-fcmplts= dnl
           -mno-custom-flogs dnl
           -mcustom-flogs= dnl
           -mno-custom-fexps dnl
           -mcustom-fexps= dnl
           -mno-custom-fatans dnl
           -mcustom-fatans= dnl
           -mno-custom-ftans dnl
           -mcustom-ftans= dnl
           -mno-custom-fsins dnl
           -mcustom-fsins= dnl
           -mno-custom-fcoss dnl
           -mcustom-fcoss= dnl
           -mno-custom-fsqrts dnl
           -mcustom-fsqrts= dnl
           -mno-custom-fabss dnl
           -mcustom-fabss= dnl
           -mno-custom-fnegs dnl
           -mcustom-fnegs= dnl
           -mno-custom-fmaxs dnl
           -mcustom-fmaxs= dnl
           -mno-custom-fmins dnl
           -mcustom-fmins= dnl
           -mno-custom-fdivs dnl
           -mcustom-fdivs= dnl
           -mno-custom-fmuls dnl
           -mcustom-fmuls= dnl
           -mno-custom-fsubs dnl
           -mcustom-fsubs= dnl
           -mno-custom-fadds dnl
           -mcustom-fadds= dnl
           -mno-custom-frdy dnl
           -mcustom-frdy= dnl
           -mno-custom-frdxhi dnl
           -mcustom-frdxhi= dnl
           -mno-custom-frdxlo dnl
           -mcustom-frdxlo= dnl
           -mno-custom-fwry dnl
           -mcustom-fwry= dnl
           -mno-custom-fwrx dnl
           -mcustom-fwrx= dnl
           -mno-custom-round dnl
           -mcustom-round= dnl
           -march= dnl
           -mgprel-sec= dnl
           -mr0rel-sec= dnl
           -mbig-endian dnl
           -mlittle-endian dnl
           -mno-cond-exec dnl
           -mmpy-option= dnl
           -mvolatile-cache dnl
           -mno-volatile-cache dnl
           -mcpu= dnl
           -msize-level= dnl
           -mmultcost= dnl
           -mtune= dnl
           -mtelephony dnl
           -mlra-priority-none dnl
           -mlra-priority-compact dnl
           -mlra-priority-noncompact dnl
           -multcost= dnl
           -mfpu= dnl
           -mtp-regno= dnl
           -mtp-regno=none dnl
           -mirq-ctrl-saved= dnl
           -mrgf-banked-regs= dnl
           -mlpc-width= dnl
           -mlong-double-128 dnl
           -mlong-double-64 dnl
           -mhard-float dnl
           -msoft-float dnl
           -mhard-quad-float dnl
           -msoft-quad-float dnl
           -mptr64 dnl
           -mptr32 dnl
           -m64 dnl
           -m32 dnl
           -mcpu= dnl
           -mtune= dnl
           -mcmodel= dnl
           -mdebug= dnl
           -mfix-at697f dnl
           -mfix-ut699 dnl
           -mfix-ut700 dnl
           -mfix-gr712rc dnl
           -mmemory-model= dnl
           -mmcu= dnl
           -mcpu= dnl
           -mlarge dnl
           -msmall dnl
           -minrt dnl
           -mhwmult= dnl
           -mcode-region= dnl
           -mdata-region= dnl
           -msilicon-errata= dnl
           -msilicon-errata-warn= dnl
           -mdevices-csv-loc= dnl
           -mmax-inline-shift= dnl
           -m32rx dnl
           -m32r2 dnl
           -m32r dnl
           -mbranch-cost=1 dnl
           -mbranch-cost=2 dnl
           -mflush-func= dnl
           -mflush-trap= dnl
           -missue-rate=1 dnl
           -missue-rate=2 dnl
           -mmodel= dnl
           -mno-flush-func dnl
           -mno-flush-trap dnl
           -msdata= dnl
           -m32 dnl
           -mcpu= dnl
           -mcpu= dnl
           -m32 dnl
           -m64 dnl
           -mbig-endian dnl
           -mlittle-endian dnl
           -mcmodel= dnl
           -march= dnl
           -mtune= dnl
           -m32 dnl
           -m64 dnl
           -mgomp dnl
           -mbypass-init-error dnl
           -mstack-size= dnl
           -msram-ecc= dnl
           -msim dnl
           -map dnl
           -mdebug-main= dnl
           -mpointer-size= dnl
           -EB dnl
           -EL dnl
           -mfp-as-gp dnl
           -mno-fp-as-gp dnl
           -mabi= dnl
           -mfloat-abi=soft dnl
           -mfloat-abi=hard dnl
           -mreduced-regs dnl
           -mfull-regs dnl
           -mbig-endian dnl
           -mlittle-endian dnl
           -mict-model= dnl
           -misr-vector-size= dnl
           -misr-secure= dnl
           -mcache-block-size= dnl
           -march= dnl
           -mcpu= dnl
           -mconfig-fpu= dnl
           -mconfig-mul= dnl
           -mconfig-register-ports= dnl
           -mcmodel= dnl
           -mcmodel= dnl
           -mghs dnl
           -msda= dnl
           -msda- dnl
           -mspace dnl
           -mtda= dnl
           -mtda- dnl
           -mv850 dnl
           -mv850e dnl
           -mv850e1 dnl
           -mv850es dnl
           -mv850e2 dnl
           -mv850e2v3 dnl
           -mv850e3v5 dnl
           -mv850e2v4 dnl
           -mzda= dnl
           -mzda- dnl
           -msoft-float dnl
           -mhard-float dnl
           -mrh850-abi dnl
           -mgcc-abi dnl
           -mbig-endian dnl
           -mlittle-endian dnl
           -mno-sdata dnl
           -msdata dnl
           -mno-pic dnl
           -mconstant-gp dnl
           -mauto-pic dnl
           -minline-float-divide-min-latency dnl
           -minline-float-divide-max-throughput dnl
           -mno-inline-float-divide dnl
           -minline-int-divide-min-latency dnl
           -minline-int-divide-max-throughput dnl
           -mno-inline-int-divide dnl
           -minline-sqrt-min-latency dnl
           -minline-sqrt-max-throughput dnl
           -mno-inline-sqrt dnl
           -mfixed-range= dnl
           -mtls-size= dnl
           -mtune= dnl
           -msched-max-memory-insns= dnl
           -milp32 dnl
           -mlp64 dnl
           -mmcu= dnl
           -mn-flash= dnl
           -mlog= dnl
           -mshort-calls dnl
           -mno-interrupts dnl
           -mbranch-cost= dnl
           -msp8 dnl
           -mdouble= dnl
           -mlong-double= dnl
           -nodevicelib dnl
           -nodevicespecs dnl
           -m1 dnl
           -m2 dnl
           -m2a dnl
           -m2a-nofpu dnl
           -m2a-single dnl
           -m2a-single-only dnl
           -m2e dnl
           -m3 dnl
           -m3e dnl
           -m4 dnl
           -m4-100 dnl
           -m4-200 dnl
           -m4-300 dnl
           -m4-nofpu dnl
           -m4-100-nofpu dnl
           -m4-200-nofpu dnl
           -m4-300-nofpu dnl
           -m4-340 dnl
           -m4-400 dnl
           -m4-500 dnl
           -m4-single dnl
           -m4-100-single dnl
           -m4-200-single dnl
           -m4-300-single dnl
           -m4-single-only dnl
           -m4-100-single-only dnl
           -m4-200-single-only dnl
           -m4-300-single-only dnl
           -m4a dnl
           -m4a-nofpu dnl
           -m4a-single dnl
           -m4a-single-only dnl
           -m4al dnl
           -mb dnl
           -mbigtable dnl
           -mbitops dnl
           -mbranch-cost= dnl
           -mcbranch-force-delay-slot dnl
           -mdalign dnl
           -mdiv= dnl
           -mdivsi3_libfunc= dnl
           -mfmovd dnl
           -mfixed-range= dnl
           -mhitachi dnl
           -misize dnl
           -ml dnl
           -mnomacsave dnl
           -mpadstruct dnl
           -mprefergot dnl
           -mrelax dnl
           -matomic-model= dnl
           -mtas dnl
           -multcost= dnl
           -mboard= dnl
           -mruntime= dnl
           -minrt dnl
           -mmcu= dnl
           -mno-relax dnl
           -mabi= dnl
           -fgo-c-header= dnl
           -fgo-dump- dnl
           -fgo-embedcfg= dnl
           -fgo-pkgpath= dnl
           -fgo-prefix= dnl
           -fgo-relative-import-path= dnl
           -fgo-debug-escape-hash= dnl
])

m4_define([CO_NEG_OPT_P],
[AS_VAR_SET([co_neg_opt_p], [no])
AS_FOR([Co_neg_flag], [co_neg_flag], [_CO_REJECT_NEGATIVE_OPTS],
       [AS_VAR_IF(Co_neg_flag, [$1],
                  [m4_do([AS_VAR_SET([co_neg_opt_p], [yes])],
                         [break])])])
AS_VAR_IF([co_neg_opt_p], [no],
          [AS_CASE([$1], [-[[fWm]]*], [AS_VAR_SET([co_has_no_opt], [yes])])])
])





# ---------------------------------------------------------------------------- #



# ============================================================================ #
# vim: set filetype=config :
