`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: USTC ESLAB
// Engineer: Xuan Wang (wgg@mail.ustc.edu.cn)
// 
// Create Date: 2019/02/08 16:29:41
// Design Name: RISCV-Pipline CPU
// Module Name: InstructionRamWrapper
// Target Devices: Nexys4
// Tool Versions: Vivado 2017.4.1
// Description: a Verilog-based instruction ram wrapper
// 
//////////////////////////////////////////////////////////////////////////////////

module InstructionRamNoCache(   // 16kB, valid address: 0x0000_0000 ~ 0x0000_3fff
    input  clk, rst,
    // port A signals, route to CPU pipline
    input  [31:0] addra,
    output [31:0] douta
);
wire [31:0] rdataa;
reg addra_valid_latch=1'b0;

always @ (posedge clk or posedge rst) begin
    if(rst) begin
        addra_valid_latch <= 1'b0;
    end else begin
        addra_valid_latch <= ( addra[31:14]==18'h0 );
    end
end
    
assign douta = addra_valid_latch ? rdataa : 0;

InstructionRam InstructionRam_inst(   // 4kB, valid address: 0x0000_0000 ~ 0x0000_0fff
    .clk       ( clk                       ),
    .rst       ( rst                       ),
    .wea       ( 4'h0                      ),  // core never write instruction ram
    .addra     ( addra[13:2]               ),
    .dina      ( 0                         ),  // core never write instruction ram
    .douta     ( rdataa                    )
);

endmodule