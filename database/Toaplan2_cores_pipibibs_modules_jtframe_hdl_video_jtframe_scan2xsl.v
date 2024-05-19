// This program was cloned from: https://github.com/atrac17/Toaplan2
// License: GNU General Public License v3.0


module jtframe_scan2x #(parameter DW=12, HLEN=256)(
    input       rst_n,
    input       clk,
    input       base_cen,
    input       basex2_cen,
    input       [DW-1:0]    base_pxl,
    input       HS,
	 input 		 scanlines,
    output  reg [DW-1:0]    x2_pxl,
    output  reg x2_HS
);

localparam AW=HLEN<=256 ? 8 : (HLEN<=512 ? 9:10 );

reg [DW-1:0] mem0[0:HLEN-1];
reg [DW-1:0] mem1[0:HLEN-1];
reg oddline;
reg [AW-1:0] wraddr, rdaddr, hscnt0, hscnt1;
reg last_HS, last_HS_base;

reg waitHS;
localparam BC=DW/3;
reg [DW-1:0]lineasc;

always @(posedge clk) if(base_cen)   last_HS_base <= HS;
always @(posedge clk) if(basex2_cen) last_HS <= HS;

wire HS_posedge =  HS && !last_HS;
wire HSbase_posedge =  HS && !last_HS_base;
wire HS_negedge = !HS &&  last_HS;

always@(posedge clk or negedge rst_n)
    if( !rst_n )
        waitHS  <= 1'b1;
    else begin
        if(HS_posedge ) waitHS  <= 1'b0;
    end

always@(posedge clk or negedge rst_n)
    if( !rst_n ) begin
        wraddr  <= {AW{1'b0}};
        rdaddr  <= {AW{1'b0}};
        oddline <= 1'b0;
    end else if(basex2_cen) begin
			
    if( !waitHS ) begin
        rdaddr <= rdaddr < (HLEN-1) ? (rdaddr+1) : 0;
		  lineasc <= mem1[rdaddr];
        x2_pxl <= oddline ? mem0[rdaddr] : ~scanlines ? mem1[rdaddr] :  {1'b0,lineasc[DW-1:DW-BC+1],1'b0,lineasc[DW-BC-1:DW-BC-BC+1],1'b0,lineasc[DW-BC-BC-1:DW-BC-BC-BC+1]}; //{1'b0,lineasc[10:8],1'b0,lineasc[7:5],1'b0,lineasc[3:1]}; //{1'b0, mem1[rdaddr][DW-1:DW-BC+1], 1'b0, mem1[rdaddr][DW-BC-1:DW-BC-BC+1], 1'b0, mem1[rdaddr][DW-BC-BC-1:DW-BC-BC-BC+1]}; 
        if( base_cen ) begin
            if( HSbase_posedge ) oddline <= ~oddline;
            wraddr <= HSbase_posedge ? 0 : (wraddr+1);
            if( oddline )
                mem1[wraddr] <= base_pxl;
            else
                mem0[wraddr] <= base_pxl;
        end 
    end
    end

always @(posedge clk or negedge rst_n)
    if( !rst_n ) begin
        x2_HS <= 1'b0;
    end else begin
        if( HS_posedge ) hscnt1 <= wraddr;
        if( HS_negedge ) hscnt0 <= wraddr;
        if( rdaddr == hscnt0 ) x2_HS <= 1'b0;
        if( rdaddr == hscnt1 ) x2_HS <= 1'b1;
    end

endmodule // jtframe_scan2x