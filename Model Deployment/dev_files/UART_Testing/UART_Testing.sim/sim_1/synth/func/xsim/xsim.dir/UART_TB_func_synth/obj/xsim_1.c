/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2013 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/

#if defined(_WIN32)
 #include "stdio.h"
#endif
#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2013 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/

#if defined(_WIN32)
 #include "stdio.h"
#endif
#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
typedef void (*funcp)(char *, char *);
extern int main(int, char**);
extern void execute_820(char*, char *);
extern void execute_821(char*, char *);
extern void execute_822(char*, char *);
extern void execute_1697(char*, char *);
extern void execute_1698(char*, char *);
extern void vlog_const_rhs_process_execute_0_fast_no_reg_no_agg(char*, char*, char*);
extern void execute_5(char*, char *);
extern void execute_6(char*, char *);
extern void vlog_simple_process_execute_0_fast_no_reg(char*, char*, char*);
extern void execute_10(char*, char *);
extern void execute_11(char*, char *);
extern void execute_13(char*, char *);
extern void execute_14(char*, char *);
extern void execute_15(char*, char *);
extern void execute_829(char*, char *);
extern void execute_830(char*, char *);
extern void execute_831(char*, char *);
extern void execute_17(char*, char *);
extern void execute_18(char*, char *);
extern void execute_19(char*, char *);
extern void execute_832(char*, char *);
extern void execute_833(char*, char *);
extern void execute_834(char*, char *);
extern void execute_33(char*, char *);
extern void execute_34(char*, char *);
extern void execute_845(char*, char *);
extern void vlog_simple_process_execute_0_fast_no_reg_no_agg(char*, char*, char*);
extern void execute_847(char*, char *);
extern void execute_848(char*, char *);
extern void execute_849(char*, char *);
extern void execute_850(char*, char *);
extern void execute_851(char*, char *);
extern void execute_82(char*, char *);
extern void execute_973(char*, char *);
extern void execute_974(char*, char *);
extern void execute_972(char*, char *);
extern void execute_85(char*, char *);
extern void execute_976(char*, char *);
extern void execute_977(char*, char *);
extern void execute_978(char*, char *);
extern void execute_979(char*, char *);
extern void execute_975(char*, char *);
extern void execute_116(char*, char *);
extern void execute_998(char*, char *);
extern void execute_999(char*, char *);
extern void execute_1000(char*, char *);
extern void execute_1001(char*, char *);
extern void execute_1002(char*, char *);
extern void execute_1003(char*, char *);
extern void execute_1004(char*, char *);
extern void execute_1005(char*, char *);
extern void execute_997(char*, char *);
extern void execute_183(char*, char *);
extern void execute_184(char*, char *);
extern void execute_1639(char*, char *);
extern void execute_815(char*, char *);
extern void execute_1640(char*, char *);
extern void execute_817(char*, char *);
extern void execute_1641(char*, char *);
extern void execute_1642(char*, char *);
extern void execute_1643(char*, char *);
extern void execute_824(char*, char *);
extern void execute_825(char*, char *);
extern void execute_826(char*, char *);
extern void execute_1699(char*, char *);
extern void execute_1700(char*, char *);
extern void execute_1701(char*, char *);
extern void execute_1702(char*, char *);
extern void execute_1703(char*, char *);
extern void transaction_13(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_14(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_15(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_16(char*, char*, unsigned, unsigned, unsigned);
extern void vlog_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
extern void transaction_51(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_52(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_53(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_54(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_61(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_138(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_142(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_146(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_150(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_154(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_288(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_292(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_296(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_300(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_304(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_380(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_384(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_388(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_392(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_396(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_400(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_404(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_408(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_577(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_581(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_585(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_747(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_751(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_755(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_759(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_763(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_767(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_771(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_775(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_779(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_783(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_787(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_903(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_907(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_911(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_915(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_919(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_923(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_927(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_931(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_943(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_947(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_951(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1032(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1036(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1040(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1148(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1152(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1156(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1226(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1253(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1257(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1261(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1377(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1381(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1385(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1389(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1393(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1397(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1401(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1405(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1409(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1413(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1417(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1426(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1435(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1439(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1443(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1447(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1451(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1455(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1459(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1463(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1480(char*, char*, unsigned, unsigned, unsigned);
funcp funcTab[153] = {(funcp)execute_820, (funcp)execute_821, (funcp)execute_822, (funcp)execute_1697, (funcp)execute_1698, (funcp)vlog_const_rhs_process_execute_0_fast_no_reg_no_agg, (funcp)execute_5, (funcp)execute_6, (funcp)vlog_simple_process_execute_0_fast_no_reg, (funcp)execute_10, (funcp)execute_11, (funcp)execute_13, (funcp)execute_14, (funcp)execute_15, (funcp)execute_829, (funcp)execute_830, (funcp)execute_831, (funcp)execute_17, (funcp)execute_18, (funcp)execute_19, (funcp)execute_832, (funcp)execute_833, (funcp)execute_834, (funcp)execute_33, (funcp)execute_34, (funcp)execute_845, (funcp)vlog_simple_process_execute_0_fast_no_reg_no_agg, (funcp)execute_847, (funcp)execute_848, (funcp)execute_849, (funcp)execute_850, (funcp)execute_851, (funcp)execute_82, (funcp)execute_973, (funcp)execute_974, (funcp)execute_972, (funcp)execute_85, (funcp)execute_976, (funcp)execute_977, (funcp)execute_978, (funcp)execute_979, (funcp)execute_975, (funcp)execute_116, (funcp)execute_998, (funcp)execute_999, (funcp)execute_1000, (funcp)execute_1001, (funcp)execute_1002, (funcp)execute_1003, (funcp)execute_1004, (funcp)execute_1005, (funcp)execute_997, (funcp)execute_183, (funcp)execute_184, (funcp)execute_1639, (funcp)execute_815, (funcp)execute_1640, (funcp)execute_817, (funcp)execute_1641, (funcp)execute_1642, (funcp)execute_1643, (funcp)execute_824, (funcp)execute_825, (funcp)execute_826, (funcp)execute_1699, (funcp)execute_1700, (funcp)execute_1701, (funcp)execute_1702, (funcp)execute_1703, (funcp)transaction_13, (funcp)transaction_14, (funcp)transaction_15, (funcp)transaction_16, (funcp)vlog_transfunc_eventcallback, (funcp)transaction_51, (funcp)transaction_52, (funcp)transaction_53, (funcp)transaction_54, (funcp)transaction_61, (funcp)transaction_138, (funcp)transaction_142, (funcp)transaction_146, (funcp)transaction_150, (funcp)transaction_154, (funcp)transaction_288, (funcp)transaction_292, (funcp)transaction_296, (funcp)transaction_300, (funcp)transaction_304, (funcp)transaction_380, (funcp)transaction_384, (funcp)transaction_388, (funcp)transaction_392, (funcp)transaction_396, (funcp)transaction_400, (funcp)transaction_404, (funcp)transaction_408, (funcp)transaction_577, (funcp)transaction_581, (funcp)transaction_585, (funcp)transaction_747, (funcp)transaction_751, (funcp)transaction_755, (funcp)transaction_759, (funcp)transaction_763, (funcp)transaction_767, (funcp)transaction_771, (funcp)transaction_775, (funcp)transaction_779, (funcp)transaction_783, (funcp)transaction_787, (funcp)transaction_903, (funcp)transaction_907, (funcp)transaction_911, (funcp)transaction_915, (funcp)transaction_919, (funcp)transaction_923, (funcp)transaction_927, (funcp)transaction_931, (funcp)transaction_943, (funcp)transaction_947, (funcp)transaction_951, (funcp)transaction_1032, (funcp)transaction_1036, (funcp)transaction_1040, (funcp)transaction_1148, (funcp)transaction_1152, (funcp)transaction_1156, (funcp)transaction_1226, (funcp)transaction_1253, (funcp)transaction_1257, (funcp)transaction_1261, (funcp)transaction_1377, (funcp)transaction_1381, (funcp)transaction_1385, (funcp)transaction_1389, (funcp)transaction_1393, (funcp)transaction_1397, (funcp)transaction_1401, (funcp)transaction_1405, (funcp)transaction_1409, (funcp)transaction_1413, (funcp)transaction_1417, (funcp)transaction_1426, (funcp)transaction_1435, (funcp)transaction_1439, (funcp)transaction_1443, (funcp)transaction_1447, (funcp)transaction_1451, (funcp)transaction_1455, (funcp)transaction_1459, (funcp)transaction_1463, (funcp)transaction_1480};
const int NumRelocateId= 153;

void relocate(char *dp)
{
	iki_relocate(dp, "xsim.dir/UART_TB_func_synth/xsim.reloc",  (void **)funcTab, 153);

	/*Populate the transaction function pointer field in the whole net structure */
}

void sensitize(char *dp)
{
	iki_sensitize(dp, "xsim.dir/UART_TB_func_synth/xsim.reloc");
}

	// Initialize Verilog nets in mixed simulation, for the cases when the value at time 0 should be propagated from the mixed language Vhdl net

void wrapper_func_0(char *dp)

{

}

void simulate(char *dp)
{
		iki_schedule_processes_at_time_zero(dp, "xsim.dir/UART_TB_func_synth/xsim.reloc");
	wrapper_func_0(dp);

	iki_execute_processes();

	// Schedule resolution functions for the multiply driven Verilog nets that have strength
	// Schedule transaction functions for the singly driven Verilog nets that have strength

}
#include "iki_bridge.h"
void relocate(char *);

void sensitize(char *);

void simulate(char *);

extern SYSTEMCLIB_IMP_DLLSPEC void local_register_implicit_channel(int, char*);
extern void implicit_HDL_SCinstantiate();

extern void implicit_HDL_SCcleanup();

extern SYSTEMCLIB_IMP_DLLSPEC int xsim_argc_copy ;
extern SYSTEMCLIB_IMP_DLLSPEC char** xsim_argv_copy ;

int main(int argc, char **argv)
{
    iki_heap_initialize("ms", "isimmm", 0, 2147483648) ;
    iki_set_sv_type_file_path_name("xsim.dir/UART_TB_func_synth/xsim.svtype");
    iki_set_crvs_dump_file_path_name("xsim.dir/UART_TB_func_synth/xsim.crvsdump");
    void* design_handle = iki_create_design("xsim.dir/UART_TB_func_synth/xsim.mem", (void *)relocate, (void *)sensitize, (void *)simulate, 0, isimBridge_getWdbWriter(), 0, argc, argv);
     iki_set_rc_trial_count(100);
    (void) design_handle;
    return iki_simulate_design();
}
