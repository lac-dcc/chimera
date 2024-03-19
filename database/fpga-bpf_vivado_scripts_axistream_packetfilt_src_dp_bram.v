//Copyright 2020 Marco Merlini. This file is part of the fpga-bpf project,
//whose license information can be found at 
//https://github.com/UofT-HPRC/fpga-bpf/blob/master/LICENSE

module dp_bram # (
    parameter ADDR_WIDTH = 10,
    parameter PORT_WIDTH = 32
) (
    input wire clk,
    
    input wire en,                           //@0
    
    input wire [ADDR_WIDTH-1:0] addra,  //@0
    input wire [ADDR_WIDTH-1:0] addrb,  //@0

    input wire [PORT_WIDTH-1:0] dia,    //@0
    input wire [PORT_WIDTH-1:0] dib,    //@0
    input wire wr_ena,                  //@0
    input wire wr_enb,                  //@0
    
    output reg [PORT_WIDTH-1:0] doa,    //@1
    output reg [PORT_WIDTH-1:0] dob     //@1
);
    reg [PORT_WIDTH-1:0] data [0:2**ADDR_WIDTH-1];

    always @(posedge clk) begin
        if (en) begin
            if (wr_ena == 1'b1) begin
                data[addra] <= dia;
            end
            doa <= data[addra]; //Read-first mode
        end
    end

    always @(posedge clk) begin
        if (en) begin
            if (wr_enb == 1'b1) begin
                data[addrb] <= dib;
            end
            dob <= data[addrb]; //Read-first mode
        end
    end
endmodule
