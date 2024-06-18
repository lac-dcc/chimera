// This program was cloned from: https://github.com/OlegMishin/A500_8MB_ide
// License: GNU General Public License v3.0

module a500_ide(
		// Amiga/CPU side
		cpu_clk,	// IN CPU clock
		cpu_rstn,// IN global RESET
		cpu_a,	// IN Address bus
		cpu_d,	// IN/OUT Data bus
		cpu_ASn,	// IN Adress select
		cpu_DSn,	// IN Data select
		cpu_RWn, // IN R/W#
		IDEACT,	// OUT IDE activity LED
		IDEINT,	// OUT IDE interrupt request
		IDEOVR_RANGE, // OUT override decoding
		
		// IDE interface side
 		IDEIRQ,	// IN Interrupt request
		IDELEDn, // IN IDE activity led
		IORDn,	// OUT IDE read
		IOWRn,	// OUT IDE write
		IORDY,	// IN IO ready 
		IDECS1n,	// OUT IDE chip select 1
		IDECS2n	// OUT IDE chip select 2
);

		// Amiga/CPU side
		input		cpu_clk;
		input		cpu_rstn;
		input		[23:1] cpu_a;
		inout		[3:0]  cpu_d;
		input		cpu_ASn;
		input 	cpu_DSn;
		input		cpu_RWn;
		
		output 	IDEACT;
		output 	IDEINT;
		output 	IDEOVR_RANGE;

		// IDE interface side
		input  	IDEIRQ;
		input  	IDELEDn;
		output 	IORDn;
		output 	IOWRn;
		input 	IORDY;
		output 	IDECS1n;
		output 	IDECS2n;
		

// Activity LED
assign IDEACT = ~IDELEDn;		


reg ASDLY = 1'b1;
reg ASDLY2 = 1'b1;
reg DTACK_INT = 1'b1;

reg IOR_INT = 1'b1;
reg IOW_INT = 1'b1;


always @(posedge cpu_clk or posedge cpu_ASn) begin

    if (cpu_ASn == 1'b1) begin

        ASDLY <= 1'b1;
        ASDLY2 <= 1'b1;

    end else begin

        ASDLY <= cpu_ASn;
        ASDLY2 <= ASDLY;

    end

end

always @(negedge cpu_clk or posedge cpu_ASn) begin

    if (cpu_ASn == 1'b1) begin

        IOR_INT <= 1'b1;
        IOW_INT <= 1'b1;
        DTACK_INT <= 1'b1;

    end else begin

        IOR_INT <= ~cpu_RWn | ASDLY | IDE_CSn;
        IOW_INT <=  cpu_RWn | ASDLY | IDE_CSn; //ASDLY2
        DTACK_INT <=  ASDLY | IDE_CSn; //ASDLY2

    end

end

// IDE chip selects

// IDE_CS1 and IDE_CS2 (IDE HARD DRIVE) selection schema:
// A14  A13  A12    Address Range     Signal Selected (LOW)
//  0    0    0    0xDA0000-0xDA0FFF         CS1
//  0    0    1    0xDA1000-0xDA1FFF         CS2
//  0    1    0    0xDA2000-0xDA2FFF         CS1
//  0    1    1    0xDA3000-0xDA3FFF         CS2
//  1    0    0    0xDA4000-0xDA4FFF         None
//  1    0    1    0xDA5000-0xDA5FFF         None
//  1    1    0    0xDA6000-0xDA6FFF         None
//  1    1    1    0xDA7000-0xDA7FFF         None

wire IDE_CSn = ({cpu_a[23:15]} != {8'hDA,1'b0}) ; // | cpu_ASn

assign IDECS1n = ((cpu_a[14:12] != 3'b000) & (cpu_a[14:12] != 3'b010)) | IDE_CSn ? 1'b1 : 1'b0;
assign IDECS2n = ((cpu_a[14:12] != 3'b001) & (cpu_a[14:12] != 3'b011)) | IDE_CSn ? 1'b1 : 1'b0;
		
// IORD/IOWR 
//wire DSHOLD = {ASDLY,AS, IDE_RWn} == {1'b1,1'b0,1'b0};
//wire IORDn = ~cpu_RWn | IDE_CSn; // | DSHOLD;
//wire IOWRn =  cpu_RWn | IDE_CSn;  // | DSHOLD; 
wire IORDn = IOR_INT;
wire IOWRn = IOW_INT; 

//Gayle registers
parameter GAYLE_ID_VAL = 4'hd;

// $DE0000 or $DA8000 (Ignores A18)
wire GAYLE_REGS = (cpu_a[23:15] != {8'hDA, 1'b1});
wire GAYLE_ID   = (cpu_a[23:15] != {8'hDE, 1'b0});
wire GAYLE_ACCESS = (GAYLE_ID & GAYLE_REGS);

reg data_out = 1'b0;

reg [3:0] gayleid = GAYLE_ID_VAL;

reg intena = 1'b0;
reg intlast = 1'b0;

// $DE1000
localparam GAYLE_ID_RD = {1'b1,2'h1,1'b1};
localparam GAYLE_ID_WR = {1'b1,2'h1,1'b0};

// $DA8000
localparam GAYLE_STAT_RD = {3'h0,1'b1};
localparam GAYLE_STAT_WR = {3'h0,1'b0};

// $DA9000
localparam GAYLE_INTCHG_RD = {3'h1,1'b1};
localparam GAYLE_INTCHG_WR = {3'h1,1'b0};

// $DAA000
localparam GAYLE_INTENA_RD = {3'h2,1'b1};
localparam GAYLE_INTENA_WR = {3'h2,1'b0};

wire INT_CHNG;
wire INT_CHNG_ACCESS = {(GAYLE_ACCESS | cpu_ASn),cpu_a[18],{cpu_a[13:12]},cpu_RWn} != {1'b0,GAYLE_INTCHG_WR};

wire DS = cpu_DSn | GAYLE_ACCESS | cpu_ASn;



dff INT_CHNG_FF (.d(cpu_d[3] & INT_CHNG), .clk(~(DS | INT_CHNG_ACCESS)),
   .clrn(cpu_rstn), .prn(~(({IDEIRQ, intlast} == 2'b10) & intena)), .q(INT_CHNG));
		
		
always @(posedge cpu_clk) begin

    intlast <= IDEIRQ;

end		


always @(negedge DS or negedge cpu_rstn) begin

    if (cpu_rstn == 1'b0) begin

        // resetting to low ensures that the next cycle
        intena <= 1'b0;
        gayleid <= 4'hD;

    end else begin

        case ({cpu_a[18],{cpu_a[13:12]},cpu_RWn})
            GAYLE_STAT_RD: data_out <= IDEIRQ;
            GAYLE_INTCHG_RD: data_out <= INT_CHNG;
            GAYLE_ID_RD: begin
                data_out <=  gayleid[3];
                gayleid <= {gayleid[2:0],1'b1};
            end
            GAYLE_ID_WR: gayleid <= 4'hD;
            GAYLE_INTENA_RD: data_out <= intena;
            GAYLE_INTENA_WR: intena <= cpu_d[3];
            default: data_out <= 'b0;
        endcase

    end
end

assign IDEINT = INT_CHNG & intena;

assign cpu_d[3:0] =  GAYLE_ACCESS | cpu_DSn | ~cpu_RWn ? 4'bzzzz : {data_out, 3'b000};



//assign IDEOVRn = IDE_CSn & GAYLE_ACCESS ? 1'bz : 1'b0;
//wire ovr_range = (cpu_a[23:16] == 8'hD9) | (cpu_a[23:16] == 8'hDB) | (cpu_a[23:16] == 8'hDA) | (cpu_a[23:16] == 8'hDE);

assign IDEOVR_RANGE = (cpu_a[23:16] == 8'hD9) | (cpu_a[23:16] == 8'hDB) | (cpu_a[23:16] == 8'hDA) | (cpu_a[23:16] == 8'hDE);
//assign IDEOVR_RANGE = DTACK_INT;

		
endmodule