// This program was cloned from: https://github.com/flyjancy/CortexM0_SoC_Task
// License: MIT License

module AHBlite_SlaveMUX (

    input HCLK,
    input HRESETn,
    input HREADY,

    //port 0
    input P0_HSEL,
    input P0_HREADYOUT,
    input P0_HRESP,
    input [31:0] P0_HRDATA,

    //port 1
    input P1_HSEL,
    input P1_HREADYOUT,
    input P1_HRESP,
    input [31:0] P1_HRDATA,

    //port 2
    input P2_HSEL,
    input P2_HREADYOUT,
    input P2_HRESP,
    input [31:0] P2_HRDATA,

    //port 3
    input P3_HSEL,
    input P3_HREADYOUT,
    input P3_HRESP,
    input [31:0] P3_HRDATA,

    //port 4
    input P4_HSEL,
    input P4_HREADYOUT,
    input P4_HRESP,
    input [31:0] P4_HRDATA,

    //output
    output wire HREADYOUT,
    output wire HRESP,
    output wire [31:0] HRDATA
);

//reg the hsel
reg [4:0] hsel_reg;

always@(posedge HCLK or negedge HRESETn) begin
    if(~HRESETn) hsel_reg <= 5'b00000;
    else if(HREADY) hsel_reg <= {P0_HSEL,P1_HSEL,P2_HSEL,P3_HSEL,P4_HSEL};
end

//hready mux
reg hready_mux;

always@(*) begin
    case(hsel_reg)
    5'b00001 : begin hready_mux = P4_HREADYOUT;end
    5'b00010 : begin hready_mux = P3_HREADYOUT;end
    5'b00100 : begin hready_mux = P2_HREADYOUT;end
    5'b01000 : begin hready_mux = P1_HREADYOUT;end
    5'b10000 : begin hready_mux = P0_HREADYOUT;end
    default : begin hready_mux = 1'b1;end
    endcase
end

assign HREADYOUT = hready_mux;

//hresp mux
reg hresp_mux;

always@(*) begin
    case(hsel_reg)
    5'b00001 : begin hresp_mux = P4_HRESP;end
    5'b00010 : begin hresp_mux = P3_HRESP;end
    5'b00100 : begin hresp_mux = P2_HRESP;end
    5'b01000 : begin hresp_mux = P1_HRESP;end
    5'b10000 : begin hresp_mux = P0_HRESP;end
    default : begin hresp_mux = 1'b0;end
    endcase
end

assign HRESP = hresp_mux;

//hrdata mux
reg [31:0] hrdata_mux;

always@(*) begin
    case(hsel_reg)
    5'b00001 : begin hrdata_mux = P4_HRDATA;end
    5'b00010 : begin hrdata_mux = P3_HRDATA;end
    5'b00100 : begin hrdata_mux = P2_HRDATA;end
    5'b01000 : begin hrdata_mux = P1_HRDATA;end
    5'b10000 : begin hrdata_mux = P0_HRDATA;end
    default : begin hrdata_mux = 32'b0;end
    endcase
end

assign HRDATA = hrdata_mux;

endmodule 