// This program was cloned from: https://github.com/Qin-shihuang/BUAA_CO_2023
// License: MIT License

module GRF(
    input  wire         clk     ,
    input  wire         rst     ,
    input  wire [31:0]  PC      ,
    input  wire [4:0]   RA1     ,
    input  wire [4:0]   RA2     ,
    input  wire [4:0]   WA      ,
    input  wire         WE      ,
    input  wire [31:0]  WD      ,
    output wire [31:0]  RD1     ,
    output wire [31:0]  RD2
);
    /*
        General Register File
        32 * 32bit registers
    */
    reg [31:0] registers [31:0];
    
    integer i;

    assign RD1 = registers[RA1];
    assign RD2 = registers[RA2];

    always @(posedge clk) begin
        if (rst) begin 
            for (i = 0; i < 32; i = i + 1) begin
                registers[i] <= 0;
            end
        end
        else begin
            if (WE) begin
                if (WA) begin
                    registers[WA] <= WD;
                        $display("@%h: $%d <= %h", PC, WA, WD);
                end
            end
        end
    end
endmodule