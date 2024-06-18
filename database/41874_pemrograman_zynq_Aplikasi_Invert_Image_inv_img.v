// This program was cloned from: https://github.com/yohanes-erwin/pemrograman_zynq
// License: MIT License

`timescale 1ns / 1ps

module inv_img
    (
        input wire clk,
        input wire rst_n,
        input wire start,
        (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_IN CLK" *)     output wire        clka,
        (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_IN RST" *)     output wire        rsta,
        (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_IN EN" *)      output wire        ena,
        (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_IN ADDR" *)    output wire [31:0] addra,
        (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_IN DIN" *)     output wire [31:0] dina,
        (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_IN WE" *)      output wire [3:0]  wea,
        (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_IN DOUT" *)    input wire  [31:0] douta,
        (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_OUT CLK" *)    output wire        clkb,
        (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_OUT RST" *)    output wire        rstb,
        (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_OUT EN" *)     output wire        enb,
        (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_OUT ADDR" *)   output wire [31:0] addrb,
        (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_OUT DIN" *)    output wire [31:0] dinb,
        (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_OUT WE" *)     output wire [3:0]  web,
        (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_OUT DOUT" *)   input wire  [31:0] doutb,
        output wire done    
    );
    
    reg start_reg;
    wire start_tick;
    reg [1:0] state_reg, state_next;
    reg [31:0] addra_reg, addra_next;
    reg [31:0] addrb_reg;
    
    // Input BRAM
    assign clka = clk;
    assign rsta = ~rst_n;
    assign ena = 1;
    assign addra = addra_reg;
    assign dina = 0;
    assign wea = 0;
 
    // Output BRAM   
    assign clkb = clk;
    assign rstb = ~rst_n;
    assign enb = 1;
    assign addrb = addrb_reg;
    assign dinb = 255 - douta; // Inversion implementaion
    assign web = (addra_reg >= 4) && (addra_reg <= 3136);
	
	assign done = (start_reg == 0);
    
    // Start pulse generator
    always @(posedge clk)
    begin
        if (!rst_n)
        begin
            start_reg <= 0;
        end
        else
        begin
            start_reg <= start;
        end    
    end    
    assign start_tick = start & ~start_reg;
    
    // Address counter FSM
    always @(posedge clk)
    begin
        if (~rst_n)
        begin
            state_reg <= 0;
            addra_reg <= 0;
            addrb_reg <= 0;
        end
        else
        begin
            state_reg <= state_next;
            addra_reg <= addra_next;
            addrb_reg <= addra_reg;
        end
    end
    always @(*)
    begin
        state_next = state_reg;
        addra_next = addra_reg;
        case (state_reg)
            0:
            begin
                if (start_tick)
                begin
                    state_next = 1;
                end
            end
            1:
            begin
                if (addra_reg == 3136)
                begin
                    state_next = 2;
                    addra_next = addra_reg + 4;
                end
                else
                begin
                    addra_next = addra_reg + 4;
                end
            end
            2:
            begin
                state_next = 0;
                addra_next = 0;
            end
        endcase
    end
    
endmodule
