// This program was cloned from: https://github.com/unic-cass/IC1-CASS-2023
// License: Apache License 2.0

`default_nettype none
`timescale 1ns/1ns

module cla 
#(
    parameter WIDTH = 32
)
(
    input [WIDTH-1:0] in1,
    input [WIDTH-1:0] in2,
    input carry_in,
    output  [WIDTH-1:0] sum,
    output  carry_out
);

wire [WIDTH-1:0] gen;
wire [WIDTH-1:0] pro;
wire [WIDTH:0] carry_tmp;

genvar j, i;
generate
 assign carry_tmp[0] = carry_in;
 
 for(j = 0; j < WIDTH; j = j + 1) begin: carry_generator
    assign gen[j] = in1[j] & in2[j];
    assign pro[j] = in1[j] | in2[j];
    assign carry_tmp[j+1] = gen[j] | pro[j] & carry_tmp[j];
 end
  
 assign carry_out = carry_tmp[WIDTH];
 
 for(i = 0; i < WIDTH; i = i+1) begin: sum_without_carry
    assign sum[i] = in1[i] ^ in2[i] ^ carry_tmp[i];
 end 
endgenerate 
endmodule

module mux_inst #(parameter N=16)( 
    input  [N-1:0] a,
    input  [N-1:0] b,
    input   sel,
    output  [N-1:0] out
    );

    assign out = (sel == 'b0) ? a : b;
            
endmodule
module LEADING_ONE_BIT #(parameter N=16, parameter K=4) (input [N-1:0] in_a, output [N-1:0] out_a);

    localparam [N-1:0] zeros = 'b0;
    wire [N-1:0] out_mux[N-1:0];
    genvar g;
   
       mux_inst #(N) mux(zeros, {zeros[N-1:1], in_a[0]}, in_a[0], out_mux[0]);
        generate 
           for(g = 1; g < N-1; g = g + 1) begin
                if (g < K) begin
                    mux_inst #(N) mux(out_mux[g-1], {zeros[N-1:g+1],in_a[g:0]}, in_a[g], out_mux[g]);
                end
                else begin
                    mux_inst #(N) mux(out_mux[g-1], {zeros[N-1:g+1],in_a[g:g-K+1], zeros[g-K:0]}, in_a[g], out_mux[g]);
                end
           end
       endgenerate
       if(K==16)
            mux_inst #(N) mux_final(out_mux[N-2], in_a[N-1:0], in_a[N-1], out_mux[N-1]);
       else
            mux_inst #(N) mux_final(out_mux[N-2], {in_a[N-1:N-K], zeros[N-K-1:0]}, in_a[N-1], out_mux[N-1]);
            
       assign out_a = out_mux[N-1];
       

endmodule

module LOB #(parameter N=16, parameter K=4) (A, B, NumA, NumB);

    input [N-1:0] A;
    input [N-1:0] B;
    output [15:0] NumA;
    output [15:0] NumB;

    wire [N-1:0] A_lead;
    wire [N-1:0] B_lead;

    LEADING_ONE_BIT #(N, K) lob1 (.in_a(A), .out_a(A_lead));
    LEADING_ONE_BIT #(N, K) lob2 (.in_a(B), .out_a(B_lead));

    assign NumA = A_lead;
    assign NumB = B_lead;

endmodule
module DEMUX (
    input wire [15:0] a, 
    input wire [15:0] b, 
    input wire [1:0] sel, 
    output wire [15:0] in_LOBA1, 
    output wire [15:0] in_LOBB1, 
    output wire [15:0] in_LOBA2, 
    output wire [15:0] in_LOBB2, 
    output wire [15:0] in_LOBA3, 
    output wire [15:0] in_LOBB3, 
    output wire [15:0] in_LOBA4, 
    output wire [15:0] in_LOBB4 
);

    assign in_LOBA1 = (sel == 2'b00) ? a : 16'b0;
    assign in_LOBB1 = (sel == 2'b00) ? b : 16'b0;
    assign in_LOBA2 = (sel == 2'b01) ? a : 16'b0;
    assign in_LOBB2 = (sel == 2'b01) ? b : 16'b0;
    assign in_LOBA3 = (sel == 2'b10) ? a : 16'b0;
    assign in_LOBB3 = (sel == 2'b10) ? b : 16'b0;
    assign in_LOBA4 = (sel == 2'b11) ? a : 16'b0;
    assign in_LOBB4 = (sel == 2'b11) ? b : 16'b0;

endmodule

module MUX (
    input wire [15:0] in_LOBA1,
    input wire [15:0] in_LOBB1,
    input wire [15:0] in_LOBA2,
    input wire [15:0] in_LOBB2,
    input wire [15:0] in_LOBA3,
    input wire [15:0] in_LOBB3,
    input wire [15:0] in_LOBA4,
    input wire [15:0] in_LOBB4,
    input wire [1:0] sel,
    output wire [15:0] out_A,
    output wire [15:0] out_B
);

    assign out_A = (sel == 2'b00) ? in_LOBA1 :
                  (sel == 2'b01) ? in_LOBA2 :
                  (sel == 2'b10) ? in_LOBA3 :
                  (sel == 2'b11) ? in_LOBA4 : 16'b0; 

    assign out_B = (sel == 2'b00) ? in_LOBB1 :
                  (sel == 2'b01) ? in_LOBB2 :
                  (sel == 2'b10) ? in_LOBB3 :
                  (sel == 2'b11) ? in_LOBB4 : 16'b0; 

endmodule

module ApproximateM  (a, b, sel, p);

    parameter N=16;
    input  [N-1:0] a;
    input  [N-1:0] b;
    input  [1:0] sel;
    output wire [2*N-1:0] p;

    wire [15:0] NumA;
    wire [15:0] NumB;

    wire [15:0] Aprecise1;
    wire [15:0] Bprecise1;

    wire [15:0] Aprecise2;
    wire [15:0] Bprecise2;

    wire [15:0] Aprecise3;
    wire [15:0] Bprecise3;

    wire [15:0] Aprecise4;
    wire [15:0] Bprecise4;

    wire [15:0] ANOTprecise1;
    wire [15:0] BNOTprecise1;

    wire [15:0] ANOTprecise2;
    wire [15:0] BNOTprecise2;

    wire [15:0] ANOTprecise3;
    wire [15:0] BNOTprecise3;

    wire [15:0] ANOTprecise4;
    wire [15:0] BNOTprecise4;

    DEMUX demux (
        .a(a),
        .b(b),
        .sel(sel),
        .in_LOBA1(Aprecise1),
        .in_LOBB1(Bprecise1),
        .in_LOBA2(Aprecise2),
        .in_LOBB2(Bprecise2),
        .in_LOBA3(Aprecise3),
        .in_LOBB3(Bprecise3),
        .in_LOBA4(Aprecise4),
        .in_LOBB4(Bprecise4)
    );

    MUX mux (
        .in_LOBA1(ANOTprecise1), // Conecte a saída in_LOBA1 do mux à sua entrada NumA
        .in_LOBB1(BNOTprecise1), // Conecte a saída in_LOBB1 do mux à sua entrada NumB
        .in_LOBA2(ANOTprecise2), // Conecte a saída in_LOBA2 do mux à sua entrada NumA
        .in_LOBB2(BNOTprecise2), // Conecte a saída in_LOBB2 do mux à sua entrada NumB
        .in_LOBA3(ANOTprecise3), // Conecte a saída in_LOBA3 do mux à sua entrada NumA
        .in_LOBB3(BNOTprecise3), // Conecte a saída in_LOBB3 do mux à sua entrada NumB
        .in_LOBA4(ANOTprecise4), // Conecte a saída in_LOBA4 do mux à sua entrada NumA
        .in_LOBB4(BNOTprecise4),  // Conecte a saída in_LOBB4 do mux à sua entrada NumB
        .sel(sel),          // Conecte a entrada 'a' do mux à sua entrada 'a'
        .out_A(NumA),          // Conecte a entrada 'b' do mux à sua entrada 'b'
        .out_B(NumB)      // Conecte o sinal de seleção 'sel' do mux à sua entrada 'sel'
    );

    LOB #(N, 4) lob_4 (.A(Aprecise1), .B(Bprecise1), .NumA(ANOTprecise1), .NumB(BNOTprecise1));
    LOB #(N, 8) lob_8 (.A(Aprecise2), .B(Bprecise2), .NumA(ANOTprecise2), .NumB(BNOTprecise2));
    LOB #(N, 12) lob_12 (.A(Aprecise3), .B(Bprecise3), .NumA(ANOTprecise3), .NumB(BNOTprecise3));
    LOB #(N, 16) lob_16 (.A(Aprecise4), .B(Bprecise4), .NumA(ANOTprecise4), .NumB(BNOTprecise4));

    assign p= NumA*NumB;

endmodule



module wb_buttons_leds #(
    parameter   [31:0]  BASE_ADDRESS    = 32'h3000_0000,        // base address
    parameter   [31:0]  SUMA_ADDRESS     = BASE_ADDRESS,
    parameter   [31:0]  SUMB_ADDRESS     = BASE_ADDRESS + 12,
    parameter   [31:0]  BUTTON_ADDRESS  = BASE_ADDRESS + 4,
    parameter   [31:0]  OPCODE_ADDRESS = BASE_ADDRESS + 16,
    parameter   [31:0]  SALIDA_ADDRESS  = BASE_ADDRESS + 8,
    parameter   [31:0]  SALIDA2_ADDRESS  = BASE_ADDRESS + 20
    ) (
`ifdef USE_POWER_PINS
    inout vccd1,	// User area 1 1.8V supply
    inout vssd1,	// User area 1 digital ground
`endif
    input wire          clk,
    input wire          reset,
    // wb interface
    input wire          i_wb_cyc,       // wishbone transaction
    input wire          i_wb_stb,       // strobe - data valid and accepted as long as !o_wb_stall
    input wire          i_wb_we,        // write enable
    input wire  [31:0]  i_wb_addr,      // address
    input wire  [31:0]  i_wb_data,      // incoming data
    output reg          o_wb_ack,       // request is completed 
    output wire         o_wb_stall,     // cannot accept req
    output reg  [31:0]  o_wb_data,      // output data

    input wire  buttons,
    output wire [11:0] led_enb,
    output reg [11:0] leds
 
    );

    cla cla_inst(
        .in1(sum_a),
        .in2(sum_b),
        .carry_in(1'b0),
        .sum(sum_cla),
        .carry_out(carry_cla)
    );    
    
    ApproximateM ApproximateM_inst(
        .a(sum_a[15:0]), 
        .b(sum_b[15:0]),
        .sel(sel_op), 
        .p(prod_aprox)
    );

    wire [31:0] sum_cla;
    wire [31:0] prod_aprox;
    reg [1:0] sel_op;
    wire carry_cla;
    wire [32:0] s_cla;
    reg [63:0] salida;
    reg [31:0] sum_a;
    reg [31:0] sum_b;
    reg [3:0] op_code;


    assign o_wb_stall = 0;
    assign led_enb = 4'b0;
    assign s_cla = {carry_cla,sum_cla};

    always @(posedge clk) begin
        case (op_code)
            4'b0000: begin
                salida[63:32]= 32'b0; 
                salida[31:0] = ~sum_a;
            end
            4'b0001: begin
                salida[63:32]= 32'b0;
                salida[31:0] = sum_a & sum_b;
            end
            4'b0010: begin
                salida[63:32]= 32'b0;
                salida[31:0] = sum_a;
            end
            4'b0011: begin
                salida[63:32]= 32'b0;
                salida[31:0] = sum_a | sum_b;
            end
            4'b0100: begin
                salida[63:32]= 32'b0;
                salida[31:0] = sum_a-1;
            end
            4'b0101: begin
                salida[63:33]= 31'b0;
                salida[32:0] = sum_a + sum_b;
            end
            4'b0110: begin
                salida[63:32]= 32'b0;
                salida[31:0] = sum_a -sum_b;
            end
            4'b0111: begin
                salida[63:33]= 31'b0;
                salida[32:0] = sum_a + 1;
            end
            4'b1000:
                salida = sum_a*sum_b;
            4'b1001: begin
                salida[63:33]= 31'b0;
                salida[32:0] = s_cla;
            end
            4'b1010:
                salida = {32'b0,sum_a} << sum_b;
            4'b1011:
                salida = {32'b0,sum_a} >> sum_b;
            4'b1100:begin
                sel_op = 2'b00;
                salida[63:32]= 32'b0;
                salida[31:0] = prod_aprox;
            end           
            4'b1101:begin
                sel_op = 2'b01;
                salida[63:32]= 32'b0;
                salida[31:0] = prod_aprox;
            end
            4'b1110:begin
                sel_op = 2'b10;
                salida[63:32]= 32'b0;
                salida[31:0] = prod_aprox;
            end
            4'b1111:begin
                sel_op = 2'b11;
                salida[63:32]= 32'b0;
                salida[31:0] = prod_aprox;
            end
            default: 
                salida = 'b0;
        endcase
    end

    always @(posedge clk) begin
        if(reset) begin
            sum_a <= 32'b0;
            sum_b <= 32'b0;
        end else if(i_wb_stb && i_wb_cyc && i_wb_we && !o_wb_stall && i_wb_addr == SUMA_ADDRESS) begin
            sum_a <= i_wb_data[31:0];
        end else if(i_wb_stb && i_wb_cyc && i_wb_we && !o_wb_stall && i_wb_addr == SUMB_ADDRESS) begin
            sum_b <= i_wb_data[31:0];
        end else if(i_wb_stb && i_wb_cyc && i_wb_we && !o_wb_stall && i_wb_addr == OPCODE_ADDRESS) begin
            op_code <= i_wb_data[3:0];
        end
        leds[3:0] <= sum_a[3:0];
        leds[7:4] <= salida[3:0];
        leds[11:8] <= op_code[3:0];
    end

    always @(posedge clk) begin
        if(reset)
            o_wb_data <= 0;
        else if(i_wb_stb && i_wb_cyc && !i_wb_we && !o_wb_stall)
            case(i_wb_addr)
                SALIDA2_ADDRESS: 
                    o_wb_data <= {salida[63:32]};
                SALIDA_ADDRESS: 
                    o_wb_data <= {salida[31:0]};
                BUTTON_ADDRESS: 
                    o_wb_data <= {31'b0, buttons};
                default:
                    o_wb_data <= 32'b0;
            endcase

    end

    always @(posedge clk) begin
        if(reset)
            o_wb_ack <= 0;
        else
            o_wb_ack <= (i_wb_stb && !o_wb_stall && (i_wb_addr == OPCODE_ADDRESS ||  i_wb_addr == SUMA_ADDRESS || 
                                                    i_wb_addr == SUMB_ADDRESS || i_wb_addr == SALIDA_ADDRESS || 
                                                    i_wb_addr == BUTTON_ADDRESS || i_wb_addr == SALIDA2_ADDRESS));
    end

endmodule

