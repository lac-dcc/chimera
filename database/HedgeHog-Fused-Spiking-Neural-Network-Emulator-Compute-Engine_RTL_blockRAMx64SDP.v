//blockRAMx64SDP.v
`timescale 1ns/100ps

//this module is derived from the "block" Simple Dual Port RAM template provided under Vivado "Tools"-->Language Templates
//modifications by: Jerry D. Harthcock, May 29, 2018

//simple dual-port block RAM
module blockRAMx64SDP #(parameter ADDRS_WIDTH = 12)(
    CLK,
    wren,
    bwren,
    wraddrs,
    wrdata,
    rden,
    rdaddrs,
    rddata
    );    

input  CLK;
input  wren;
input  [7:0] bwren;
input  [ADDRS_WIDTH-1:0] wraddrs;                  
input  [63:0] wrdata;
input  rden;
input  [ADDRS_WIDTH-1:0] rdaddrs;
output [63:0] rddata;


  parameter NB_COL = 8;                       // Specify number of columns (number of bytes)
  parameter COL_WIDTH = 8;                    // Specify column width (byte width, typically 8 or 9)
  parameter RAM_PERFORMANCE = "LOW_LATENCY";  // Select "HIGH_PERFORMANCE" or "LOW_LATENCY" 
  parameter INIT_FILE = "";                   // Specify name/location of RAM initialization file if using one (leave blank if not)

  wire [ADDRS_WIDTH-1:0] wraddrs;             // Port A address bus, width determined from RAM_DEPTH
  wire [ADDRS_WIDTH-1:0] rdaddrs;             // Port B address bus, width determined from RAM_DEPTH
  wire [NB_COL-1:0] wea;                      // Port A write enable
  assign wea = {bwren[7] && wren, bwren[6] && wren, bwren[5] && wren, bwren[4] && wren, bwren[3] && wren, bwren[2] && wren, bwren[1] && wren, bwren[0] && wren};
  wire enb;                                   // Port B RAM Enable, for additional power savings, disable BRAM when not in use
  assign enb = wren || rden;
  wire rstb;                                  // Port B output reset (does not affect memory contents)
  assign rstb = 1'b0;                         // Port B output reset (does not affect memory contents)
  wire regceb;                                // Port B output register enable
  assign regceb = 1'b0;                       // Port B output register enable

  reg [(NB_COL*COL_WIDTH)-1:0] RAM [(2**ADDRS_WIDTH)-1:0];
  reg [(NB_COL*COL_WIDTH)-1:0] ram_data = {(NB_COL*COL_WIDTH){1'b0}};
  reg [(NB_COL*COL_WIDTH)-1:0] rddata_reg;
  

  // The following code either initializes the memory values to a specified file or to all zeros to match hardware
  generate
    if (INIT_FILE != "") begin: use_init_file
      initial
        $readmemh(INIT_FILE, RAM, 0, (2**ADDRS_WIDTH)-1);
    end else begin: init_bram_to_zero
      integer ram_index;
      initial
        for (ram_index = 0; ram_index < (2**ADDRS_WIDTH); ram_index = ram_index + 1)
          RAM[ram_index] = {(NB_COL*COL_WIDTH){1'b0}};
    end
  endgenerate


  always @(posedge CLK) if (enb) ram_data <= RAM[rdaddrs];
        
  generate
  genvar i;
     for (i = 0; i < NB_COL; i = i+1) begin: byte_write
       always @(posedge CLK)
           if (wea[i]) RAM[wraddrs][(i+1)*COL_WIDTH-1:i*COL_WIDTH] <= wrdata[(i+1)*COL_WIDTH-1:i*COL_WIDTH];
     end
  endgenerate


  //  The following code generates HIGH_PERFORMANCE (use output register) or LOW_LATENCY (no output register)
  generate
    if (RAM_PERFORMANCE == "LOW_LATENCY") begin: no_output_register

      // The following is a 1 clock cycle read latency at the cost of a longer clock-to-out timing
       assign rddata = ram_data;

    end 
    else begin: output_register

      // The following is a 2 clock cycle read latency with improve clock-to-out timing

      reg [(NB_COL*COL_WIDTH)-1:0] rddata_reg = {(NB_COL*COL_WIDTH){1'b0}};


      always @(posedge CLK)
        if (rstb) rddata_reg <= {(NB_COL*COL_WIDTH){1'b0}};
        else if (regceb) rddata_reg <= ram_data;

      assign rddata = rddata_reg;

    end
  endgenerate

  //  The following function calculates the address width based on specified RAM depth
  function integer clogb2;
    input integer depth;
      for (clogb2=0; depth>0; clogb2=clogb2+1) depth = depth >> 1;
  endfunction





endmodule