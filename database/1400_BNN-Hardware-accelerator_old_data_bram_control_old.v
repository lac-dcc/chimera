// This program was cloned from: https://github.com/space789/BNN-Hardware-accelerator
// License: MIT License

module bram_control #(
    parameter integer MAC_NUM = 256,
    parameter integer BRAM_ADDRESS_WIDTH = 12
)
(
    //golbal
    input wire clk,
    input wire rst_n,

    //data
    //TODO:從AXI寫BRAM的部分還沒有實作
        // input wire [31:0] axi_in,

    input wire [5*MAC_NUM-1:0] weight_from_bram_A,
    input wire [5*MAC_NUM-1:0] weight_from_bram_B,

    output wire [5*MAC_NUM-1:0] weight_out,

        // output wire [5*MAC_NUM-1:0] weight_to_bram_A,
        // output wire [5*MAC_NUM-1:0] weight_to_bram_B,
    
    output reg [BRAM_ADDRESS_WIDTH-1:0] bram_address_A,
    output wire [BRAM_ADDRESS_WIDTH-1:0] bram_address_B,

    output wire bram_A_en,
    output wire bram_B_en,

    //control
        //input wire write_en,
    input wire address_reset,
    input wire bram_control_add1,
    input wire bram_control_add2,
    input wire port_sel,
    output wire weight_from_bram_valid

);
//TODO:未測試
    /*
        bram_control再準備好值之後等待read_en將值讀走，FSM會再根據讀取長度(只讀portA還是讀A和B)，決定是否要
        更新address並且讀取下筆資料。
    */
    localparam S0=2'd0,S1=2'd1,VALID=2'd2;
    
    reg [1:0] state;

    assign bram_A_en=1;
    assign bram_B_en=1;

    assign weight_from_bram_valid=(state==VALID || state==S0);
    assign weight_out=(port_sel) ? weight_from_bram_B:weight_from_bram_A;

    assign bram_address_B = bram_address_A+1;
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            bram_address_A<=0;
        end
        else begin
            if(address_reset) begin
                bram_address_A<=0;
            end
            else if(bram_control_add1) begin
                bram_address_A<=bram_address_A+1;
            end
            else if(bram_control_add2) begin
                bram_address_A<=bram_address_A+2;
            end
        end
    end
    
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            state<=S0;
        end
        else begin
            case (state)
                S0:state<=address_reset ? S0:S1;
                S1:state<=address_reset ? S0:VALID;
                VALID:state<=(bram_control_add1 || bram_control_add2)?S0:VALID;
                default:state<=S0;         
            endcase
        end
    end


endmodule