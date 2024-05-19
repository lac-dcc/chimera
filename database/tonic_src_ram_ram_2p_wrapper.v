// This program was cloned from: https://github.com/minmit/tonic
// License: BSD 3-Clause "New" or "Revised" License

// Description:
// Model for Vivado True Dual Port Memory
// Doesn't give any guarantees for compliance with Vivado's memory behavior
// Notes:
// - clka and clkb must be the same
// - no data forwarding between read and write ports
// - no assumption about write ordering in case of address collision
// - 1 cycle read latency

`timescale 1ns/1ns

module ram_2p_wrapper #(
    parameter   RAM_TYPE        = -1,
    parameter   RAM_DEPTH       = -1,
    parameter   RAM_ADDR_WIDTH  = -1,
    parameter   RAM_DATA_WIDTH  = -1
)(
    input                                   rst_n,
    input                                   clka,
    input                                   ena,
    input                                   wea,
    input           [RAM_ADDR_WIDTH-1:0]    addra,
    input           [RAM_DATA_WIDTH-1:0]    dina,
    output          [RAM_DATA_WIDTH-1:0]    douta,
    input                                   clkb,
    input                                   enb,
    input                                   web,
    input           [RAM_ADDR_WIDTH-1:0]    addrb,
    input           [RAM_DATA_WIDTH-1:0]    dinb,
    output          [RAM_DATA_WIDTH-1:0]    doutb
);
`ifdef VCS_SIMULATION

reg     [RAM_DATA_WIDTH-1:0]    mem [RAM_DEPTH-1:0];
reg     [RAM_DATA_WIDTH-1:0]    douta_f;
reg     [RAM_DATA_WIDTH-1:0]    doutb_f;

genvar ii;

assign douta = douta_f;
assign doutb = doutb_f;

generate
    for (ii = 0; ii < RAM_DEPTH; ii = ii + 1) begin: mem_gen
        always @(posedge clka) begin
            if (~rst_n) begin
                mem[ii] <= {RAM_DATA_WIDTH{1'b0}};
            end
            else begin
                mem[ii] <= ena & wea & (ii == addra) ? dina :
                           enb & web & (ii == addrb) ? dinb : mem[ii];
            end
        end
    end
endgenerate

always @(posedge clka) begin
    douta_f <= ena & ~wea ? mem[addra] : {RAM_DATA_WIDTH{1'bx}};
    doutb_f <= enb & ~web ? mem[addrb] : {RAM_DATA_WIDTH{1'bx}};
end

`else   // VCS_SIMULATION

// Vivado IP
generate
    if (RAM_TYPE == 0) begin
        ram_2p_type_0  ram_2p   (
          .clka     (clka   ),
          .ena      (ena    ),
          .wea      (wea    ),
          .addra    (addra  ),
          .dina     (dina   ),
          .douta    (douta  ),
          .clkb     (clkb   ),
          .enb      (enb    ),
          .web      (web    ),
          .addrb    (addrb  ),
          .dinb     (dinb   ),
          .doutb    (doutb  ) 
        );
    end
    else if (RAM_TYPE == 1) begin
        ram_2p_type_1  ram_2p   (
          .clka     (clka   ),
          .ena      (ena    ),
          .wea      (wea    ),
          .addra    (addra  ),
          .dina     (dina   ),
          .douta    (douta  ),
          .clkb     (clkb   ),
          .enb      (enb    ),
          .web      (web    ),
          .addrb    (addrb  ),
          .dinb     (dinb   ),
          .doutb    (doutb  ) 
        );
    end
    else if (RAM_TYPE == 2) begin
        ram_2p_type_2  ram_2p   (
          .clka     (clka   ),
          .ena      (ena    ),
          .wea      (wea    ),
          .addra    (addra  ),
          .dina     (dina   ),
          .douta    (douta  ),
          .clkb     (clkb   ),
          .enb      (enb    ),
          .web      (web    ),
          .addrb    (addrb  ),
          .dinb     (dinb   ),
          .doutb    (doutb  ) 
        );
    end
    else if (RAM_TYPE == 3) begin
        ram_2p_type_3  ram_2p   (
          .clka     (clka   ),
          .ena      (ena    ),
          .wea      (wea    ),
          .addra    (addra  ),
          .dina     (dina   ),
          .douta    (douta  ),
          .clkb     (clkb   ),
          .enb      (enb    ),
          .web      (web    ),
          .addrb    (addrb  ),
          .dinb     (dinb   ),
          .doutb    (doutb  ) 
        );
    end
    else if (RAM_TYPE == 4) begin
        ram_2p_type_4  ram_2p   (
          .clka     (clka   ),
          .ena      (ena    ),
          .wea      (wea    ),
          .addra    (addra  ),
          .dina     (dina   ),
          .douta    (douta  ),
          .clkb     (clkb   ),
          .enb      (enb    ),
          .web      (web    ),
          .addrb    (addrb  ),
          .dinb     (dinb   ),
          .doutb    (doutb  ) 
        );
    end
    else if (RAM_TYPE == 5) begin
        ram_2p_type_5  ram_2p   (
          .clka     (clka   ),
          .ena      (ena    ),
          .wea      (wea    ),
          .addra    (addra  ),
          .dina     (dina   ),
          .douta    (douta  ),
          .clkb     (clkb   ),
          .enb      (enb    ),
          .web      (web    ),
          .addrb    (addrb  ),
          .dinb     (dinb   ),
          .doutb    (doutb  ) 
        );
    end
    else if (RAM_TYPE == 6) begin
        ram_2p_type_6  ram_2p   (
          .clka     (clka   ),
          .ena      (ena    ),
          .wea      (wea    ),
          .addra    (addra  ),
          .dina     (dina   ),
          .douta    (douta  ),
          .clkb     (clkb   ),
          .enb      (enb    ),
          .web      (web    ),
          .addrb    (addrb  ),
          .dinb     (dinb   ),
          .doutb    (doutb  ) 
        );
    end

endgenerate

`endif  // VCS_SIMULATION


//-----------------------------------------------------------
// Functions
//-----------------------------------------------------------

// clogb2 function
`include "clogb2.vh"

endmodule
