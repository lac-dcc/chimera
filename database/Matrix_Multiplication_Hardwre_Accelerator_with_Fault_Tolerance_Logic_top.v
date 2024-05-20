// This program was cloned from: https://github.com/Mavvenger/Matrix_Multiplication_Hardwre_Accelerator_with_Fault_Tolerance_Logic
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/03/18 12:57:42
// Design Name: 
// Module Name: top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top(
    input [1023:0] data_in,
    input clk,
    input rst_n,
    input start,
    input store_C_ready,

    output [1055:0] dataCf_out,
    output fetch_A,
    output fetch_B,
    output store_C,
    output finish
    );
    //定义模块间接口信号
    //FSM模块输出
    wire FSMCG_generate_enable,
         FSMCG_fetch_A,
         FSMCG_fetch_B,
         FSMCS_shift_enable,
         FSMCS_shift_direction,
         FSMCS_direct_connection,
         FSMCV_verify_enable,
         FSMMACs_MACs_enable;
    wire [1:0] FSMCGCV_detect_correct;
    wire [5:0] FSMCS_step_size;
    //CV模块输出
    wire CVFSM_error,
         CVFSM_column_verify_ready;
    wire [32:0] CVFSM_column_indicator;
    //MACs模块输出
    wire [1055:0] MACsCSBehind_dataC_out;
    wire MACsFSM_MACs_ready;
    wire [4:0] MACsCG_mux_sel;
    //CG模块输出
    wire [31:0] CGMACs_dataAc_out;
    wire [1055:0] CGCSFront_dataBr_out;
    wire [2:0] CGFSM_full;
    wire CGCSFront_dataBr_out_ready,
         CGFSM_fetch_A_ready,
         CGFSM_fetch_B_ready;
    //CSFront模块输出
    wire [1055:0] CSFrontMACs_dataBr_out;
    wire CSFrontMACs_shift_ready;
    //CSBehind模块输出
    wire [1055:0] CSBehindCV_dataBr_out;
    wire CSBehindFSM_shift_ready;

     CheckSum_Generation u_CheckSum_Generation (
          //input ports
               .data_in                 (data_in[1023:0]               ),
               .mux_sel                 (MACsCG_mux_sel[4:0]           ),
               .clk                     (clk                           ),
               .detect_correct          (FSMCGCV_detect_correct[1:0]   ),
               .generate_enable         (FSMCG_generate_enable         ),
               .fetch_A                 (FSMCG_fetch_A                 ),
               .fetch_B                 (FSMCG_fetch_B                 ),
          //output ports
               .dataAc_out              (CGMACs_dataAc_out[31:0]       ),
               .dataBr_out              (CGCSFront_dataBr_out[1055:0]  ),
               .dataBr_out_ready        (CGCSFront_dataBr_out_ready    ),
               .fetch_A_ready           (CGFSM_fetch_A_ready           ),
               .fetch_B_ready           (CGFSM_fetch_B_ready           ),
               .full                    (CGFSM_full[2:0]               )
     );
    //dataBr_out_ready信号和循环移位器模块之间的连接
     wire AndCSFront_shift_enable,
          AndCSFront_direct_connection;
     assign AndCSFront_shift_enable = CGCSFront_dataBr_out_ready && FSMCS_shift_enable,
            AndCSFront_direct_connection = CGCSFront_dataBr_out_ready && FSMCS_direct_connection;
     FSM_for_Baseline_with_Fault_Tolerance_Logic u_FSM_for_Baseline_with_Fault_Tolerance_Logic (
          //input ports
               .clk                     ( clk                          ),
               .rst_n                   ( rst_n                        ),
               .start                   ( start                        ),
               .store_C_ready           ( store_C_ready                ),
               .MACs_ready              ( MACsFSM_MACs_ready           ),
               .fetch_A_ready           ( CGFSM_fetch_A_ready          ),
               .fetch_B_ready           ( CGFSM_fetch_B_ready          ),
               .full                    ( CGFSM_full[2:0]              ),
               .shift_ready             ( CSBehindFSM_shift_ready      ),
               .error                   ( CVFSM_error                  ),
               .column_indicator        ( CVFSM_column_indicator[32:0] ),
               .column_verify_ready     ( CVFSM_column_verify_ready    ),
          //output ports
               .detect_correct          ( FSMCGCV_detect_correct[1:0]  ),
               .generate_enable         ( FSMCG_generate_enable        ),
               .fetch_A                 ( FSMCG_fetch_A                ),
               .fetch_B                 ( FSMCG_fetch_B                ),
               .step_size               ( FSMCS_step_size[5:0]         ),
               .shift_enable            ( FSMCS_shift_enable           ),
               .shift_direction         ( FSMCS_shift_direction        ),
               .direct_connection       ( FSMCS_direct_connection      ),
               .verify_enable           ( FSMCV_verify_enable          ),
               .MACs_enable             ( FSMMACs_MACs_enable          ),
               .store_C                 ( store_C                      ),
               .finish                  ( finish                       )
     );
          assign fetch_A = FSMCG_fetch_A,
                 fetch_B = FSMCG_fetch_B;
     CheckSum_Verification  u_CheckSum_Verification (
          //input ports
               .dataCf_in               ( CSBehindCV_dataBr_out[1055:0] ),
               .clk                     ( clk                           ),
               .verify_enable           ( FSMCV_verify_enable           ),
               .detect_correct          ( FSMCGCV_detect_correct[1:0]   ),
               .fetch_Cf_row            ( CSBehindFSM_shift_ready       ),
          //output ports
               .column_indicator        ( CVFSM_column_indicator [32:0] ),
               .error                   ( CVFSM_error                   ),
               .column_verify_ready     ( CVFSM_column_verify_ready     )
     );
    //MACs模块前级循环移位器模块的shift_ready信号、后级循环移位器模块的shift_ready信号的连接
    // wire AndMACs_MACs_enbale;
    // assign AndMACs_MACs_enbale = CSFrontMACs_shift_ready&&FSMMACs_MACs_enable;
    MACs  u_MACs (
          //input ports
               .dataA_in                ( CGMACs_dataAc_out     [31:0]    ),
               .dataB_in                ( CSFrontMACs_dataBr_out [1055:0] ),
               .MACs_enable             ( FSMMACs_MACs_enable             ),
               .clk                     ( clk                             ),
               .fetch_Br_row            ( CSFrontMACs_shift_ready         ),//直接接到前级循环移位器的ready输出端口
          //output ports
               .dataC_out               ( MACsCSBehind_dataC_out[1055:0]  ),
               .MACs_ready              ( MACsFSM_MACs_ready            ),
               .mux_sel                 ( MACsCG_mux_sel       [4:0]    )
     );
     //MACs_ready信号和循环移位器、状态机模块之间的连接
     wire AndCSBehind_shift_enable,
          AndCSBehind_direct_connection;
     assign AndCSBehind_shift_enable = MACsFSM_MACs_ready && FSMCS_shift_enable,
            AndCSBehind_direct_connection = MACsFSM_MACs_ready && FSMCS_direct_connection;
     
     Circular_Shifter  u_Circular_Shifter_Front (
          //input ports
               .dataBr_Cf_in            ( CGCSFront_dataBr_out [1055:0] ),
               .shift_direction         ( FSMCS_shift_direction         ),
               .step_size               ( FSMCS_step_size        [5:0]  ),
               .clk                     ( clk                           ),
               .shift_enable            ( AndCSFront_shift_enable       ),
               .direct_connection       ( AndCSFront_direct_connection  ),
          //output ports
               .dataBr_Cf_out           ( CSFrontMACs_dataBr_out [1055:0] ),
               .shift_ready             ( CSFrontMACs_shift_ready       )
     );
     
     //对MACsCSBehind_dataC_out的第512位进行翻转
     wire SpecificBit_of_MACsCSBehind_dataC_out;
     assign SpecificBit_of_MACsCSBehind_dataC_out = ~MACsCSBehind_dataC_out[512];
     //对后级循环移位器移位方向指定为前级循环移位器相反的方向
     wire Behind_FSMCS_shift_direction;
     assign Behind_FSMCS_shift_direction = ~FSMCS_shift_direction;
     Circular_Shifter  u_Circular_Shifter_Behind (       
          //input ports            
               .dataBr_Cf_in            ( {MACsCSBehind_dataC_out[1055:513],SpecificBit_of_MACsCSBehind_dataC_out,MACsCSBehind_dataC_out[511:0]}),
               .shift_direction         (  Behind_FSMCS_shift_direction ),
               .step_size               ( FSMCS_step_size       [5:0]   ),
               .clk                     ( clk                           ),
               .shift_enable            ( AndCSBehind_shift_enable      ),
               .direct_connection       ( AndCSBehind_direct_connection ),
          //output ports          
               .dataBr_Cf_out           ( CSBehindCV_dataBr_out [1055:0]),
               .shift_ready             ( CSBehindFSM_shift_ready       )
     );      
     //MACs模块前级循环移位器模块的shift_ready信号、后级循环移位器模块的shift_ready信号的连接
     assign AndMACs_MACs_enable = CSFrontMACs_shift_ready && FSMMACs_MACs_enable;
     assign dataCf_out = CSBehindCV_dataBr_out;

endmodule
