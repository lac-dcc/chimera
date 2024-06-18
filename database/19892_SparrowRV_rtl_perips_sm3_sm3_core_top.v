// This program was cloned from: https://github.com/xiaowuzxc/SparrowRV
// License: MIT License

`define SM3_INPT_DW_32
`define INPT_DW    32
`define INPT_DW1        (`INPT_DW - 1)
`define INPT_BYTE_DW1   (`INPT_DW/8 - 1)
`define INPT_BYTE_DW    (`INPT_BYTE_DW1 + 1)
module sm3_core_top (
    input                       clk,
    input                       rst_n,
    input [`INPT_DW1:0]         msg_inpt_d,//消息数据32bit
    input [`INPT_BYTE_DW1:0]    msg_inpt_vld_byte,//消息字节使能
    input                       msg_inpt_vld,//消息输入有效
    input                       msg_inpt_lst,//消息输入最后一个数据
    
    output        wire          msg_inpt_rdy,//消息输入准备好

    output wire   [255:0]       cmprss_otpt_res,//杂凑结果256bit
    output        wire          cmprss_otpt_vld//杂凑结果输出有效
);

//interface
wire                       pad_otpt_ena;
wire [`INPT_DW1:0]         pad_otpt_d;
wire                       pad_otpt_lst;
wire                       pad_otpt_vld;

wire [`INPT_DW1:0]         expnd_otpt_wj; 
wire [`INPT_DW1:0]         expnd_otpt_wjj; 
wire                       expnd_otpt_lst;
wire                       expnd_otpt_vld; 


sm3_pad_core U_sm3_pad_core(

    .clk                    (clk                    ),
    .rst_n                  (rst_n                  ),

    .msg_inpt_d_i           (msg_inpt_d             ),
    .msg_inpt_vld_byte_i    (msg_inpt_vld_byte      ),
    .msg_inpt_vld_i         (msg_inpt_vld           ),
    .msg_inpt_lst_i         (msg_inpt_lst           ),

    .msg_inpt_rdy_o         (msg_inpt_rdy           ),

    .pad_otpt_ena_i         (pad_otpt_ena        ),

    .pad_otpt_d_o           (pad_otpt_d             ),
    .pad_otpt_lst_o         (pad_otpt_lst           ),
    .pad_otpt_vld_o         (pad_otpt_vld           )
); 

sm3_expnd_core U_sm3_expnd_core(

    .clk                    (clk                        ),
    .rst_n                  (rst_n                      ),


    .pad_inpt_d_i               ( pad_otpt_d                    ),
    .pad_inpt_vld_i             ( pad_otpt_vld                  ),
    .pad_inpt_lst_i             ( pad_otpt_lst                  ),

    .pad_inpt_rdy_o             ( pad_otpt_ena                  ),
    .expnd_otpt_wj_o            ( expnd_otpt_wj                 ),
    .expnd_otpt_wjj_o           ( expnd_otpt_wjj                ),
    .expnd_otpt_lst_o           ( expnd_otpt_lst                ),
    .expnd_otpt_vld_o           ( expnd_otpt_vld                )
);   

sm3_cmprss_core U_sm3_cmprss_core(

    .clk                    (clk                        ),
    .rst_n                  (rst_n                      ),


    .expnd_inpt_wj_i            ( expnd_otpt_wj                  ),
    .expnd_inpt_wjj_i           ( expnd_otpt_wjj                  ),
    .expnd_inpt_lst_i           ( expnd_otpt_lst                  ),
    .expnd_inpt_vld_i           ( expnd_otpt_vld                  ),


    .cmprss_otpt_res_o          ( cmprss_otpt_res               ),
    .cmprss_otpt_vld_o          ( cmprss_otpt_vld               )

);  
    
endmodule