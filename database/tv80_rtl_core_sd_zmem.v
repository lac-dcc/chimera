// This program was cloned from: https://github.com/hutch31/tv80
// License: MIT License

module sd_zmem
  #(parameter mem_size=8192,
    parameter z_asz=16)
  (
   input        clk,
   input        reset,

   /*AUTOINPUT*/
   // Beginning of automatic inputs (from unused autoinst inputs)
   input [z_asz-1:0]	addr,			// To access64 of sd_access64.v
   input		cs_n,			// To access64 of sd_access64.v
   input		mreq_n,			// To access64 of sd_access64.v
   input		rd_n,			// To access64 of sd_access64.v
   input [7:0]		wr_data,		// To access64 of sd_access64.v
   input		wr_n,			// To access64 of sd_access64.v
   // End of automatics
   /*AUTOOUTPUT*/
   // Beginning of automatic outputs (from unused autoinst outputs)
   output		ack,			// From access64 of sd_access64.v
   output [7:0]		rd_data		// From access64 of sd_access64.v
   // End of automatics
   );

  wire [63:0] 		s2z_data;		// From sboard of sd_scoreboard.v
  wire [63:0]		z2s_data;		// From access64 of sd_access64.v
  wire [s_asz-1:0]	z2s_itemid;		// From access64 of sd_access64.v
  wire [63:0]		z2s_mask;		// From access64 of sd_access64.v
   /*AUTOWIRE*/
   // Beginning of automatic wires (for undeclared instantiated-module outputs)
   wire			s2z_drdy;		// From access64 of sd_access64.v
   wire			s2z_srdy;		// From sboard of sd_scoreboard.v
   wire			z2s_drdy;		// From sboard of sd_scoreboard.v
   wire			z2s_req_type;		// From access64 of sd_access64.v
   wire			z2s_srdy;		// From access64 of sd_access64.v
   // End of automatics

  localparam s_asz = $clog2(mem_size);

  sd_access64 #(/*AUTOINSTPARAM*/
		// Parameters
		.z_asz			(z_asz),
		.s_asz			(s_asz)) access64
    (/*AUTOINST*/
     // Outputs
     .ack				(ack),
     .rd_data				(rd_data[7:0]),
     .z2s_srdy				(z2s_srdy),
     .z2s_req_type			(z2s_req_type),
     .z2s_mask				(z2s_mask[63:0]),
     .z2s_data				(z2s_data[63:0]),
     .z2s_itemid			(z2s_itemid[s_asz-1:0]),
     .s2z_drdy				(s2z_drdy),
     // Inputs
     .reset				(reset),
     .clk				(clk),
     .mreq_n				(mreq_n),
     .cs_n				(cs_n),
     .rd_n				(rd_n),
     .wr_n				(wr_n),
     .addr				(addr[z_asz-1:0]),
     .wr_data				(wr_data[7:0]),
     .z2s_drdy				(z2s_drdy),
     .s2z_srdy				(s2z_srdy),
     .s2z_data				(s2z_data[63:0]));

/* sd_scoreboard AUTO_TEMPLATE
 (
    .c_txid				(),
    .p_txid				(),
    .c_\(.*\)           (z2s_\1),
    .p_\(.*\)           (s2z_\1),
  );
 */
  sd_scoreboard #(
		  // Parameters
		  .width		(64),
		  .items		(mem_size),
		  .use_txid		(0),
		  .use_mask		(1),
		  .txid_sz		(8)) sboard
    (/*AUTOINST*/
     // Outputs
     .c_drdy				(z2s_drdy),		 // Templated
     .p_srdy				(s2z_srdy),		 // Templated
     .p_txid				(),			 // Templated
     .p_data				(s2z_data),		 // Templated
     // Inputs
     .clk				(clk),
     .reset				(reset),
     .c_srdy				(z2s_srdy),		 // Templated
     .c_req_type			(z2s_req_type),		 // Templated
     .c_txid				(),			 // Templated
     .c_mask				(z2s_mask),		 // Templated
     .c_data				(z2s_data),		 // Templated
     .c_itemid				(z2s_itemid),		 // Templated
     .p_drdy				(s2z_drdy));		 // Templated

endmodule // sd_zmem
// Local Variables:
// verilog-library-directories:("." "~/proj/srdydrdy_lib/rtl/verilog/utility")
// End:  
