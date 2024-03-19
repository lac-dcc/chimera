
// SDRAM 初始化过程各个状态
`define     I_NOP           5'd0                            //等待上电200us稳定期结束
`define     I_PRE           5'd1                            //预充电状态
`define     I_TRP           5'd2                            //等待预充电完成       tRP
`define     I_AR            5'd3                            //自动刷新            
`define     I_TRF           5'd4                            //等待自动刷新结束    tRC
`define     I_MRS           5'd5                            //模式寄存器设置
`define     I_TRSC          5'd6                            //等待模式寄存器设置完成 tRSC
`define     I_DONE          5'd7                            //初始化完成

// SDRAM 工作过程各个状态
`define     W_IDLE          4'd0                            //空闲
`define     W_ACTIVE        4'd1                            //行有效
`define     W_TRCD          4'd2                            //行有效等待
`define     W_READ          4'd3                            //读操作
`define     W_CL            4'd4                            //潜伏期
`define     W_RD            4'd5                            //读数据
`define     W_WRITE         4'd6                            //写操作
`define     W_WD            4'd7                            //写数据
`define     W_TWR           4'd8                            //写回
`define     W_PRE           4'd9                            //预充电
`define     W_TRP           4'd10                           //预充电等待
`define     W_AR            4'd11                           //自动刷新
`define     W_TRFC          4'd12                           //自动刷新等待
  
//延时参数
`define     end_trp         cnt_clk == TRP_CLK              //预充电有效周期结束
`define     end_trfc        cnt_clk == TRC_CLK              //自动刷新周期结束
`define     end_trsc        cnt_clk == TRSC_CLK             //模式寄存器设置时钟周期结束
`define     end_trcd        cnt_clk == TRCD_CLK-1           //行选通周期结束
`define     end_tcl         cnt_clk == TCL_CLK-1            //潜伏期结束
`define     end_rdburst     cnt_clk == sdram_rd_burst-4     //读突发终止
`define     end_tread       cnt_clk == sdram_rd_burst+2     //突发读结束     
`define     end_wrburst     cnt_clk == sdram_wr_burst-1     //写突发终止
`define     end_twrite      cnt_clk == sdram_wr_burst-1     //突发写结束
`define     end_twr         cnt_clk == TWR_CLK              //写回周期结束

//SDRAM控制信号命令
`define     CMD_INIT        5'b01111                        // INITIATE
`define     CMD_NOP         5'b10111                        // NOP COMMAND
`define     CMD_ACTIVE      5'b10011                        // ACTIVE COMMAND
`define     CMD_READ        5'b10101                        // READ COMMADN
`define     CMD_WRITE       5'b10100                        // WRITE COMMAND
`define     CMD_B_STOP      5'b10110                        // BURST STOP
`define     CMD_PRGE        5'b10010                        // PRECHARGE
`define     CMD_A_REF       5'b10001                        // AOTO REFRESH
`define     CMD_LMR         5'b10000                        // LODE MODE REGISTER
