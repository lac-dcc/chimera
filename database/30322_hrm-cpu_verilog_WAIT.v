// This program was cloned from: https://github.com/adumont/hrm-cpu
// License: GNU General Public License v3.0

`default_nettype none

module WAIT (
	// input signals
	input  wire [7:0] din,
	input  wire       start,
	// output signals
	output wire       busy,
	// generic signals
	input wire        clk,
	input wire        rst
);

`ifndef SYNTHESIS
   parameter
   MAXC = 3'd 5, // FSM will keep busy=1 for MAXC clocks
   high_w = 8,
   low_w  = 3,
   cnt_w = high_w + low_w;
`else
   parameter
   MAXC = 20'd 600_000, // 50ms @ 12MHz = 1/20 s
   high_w = 8,
   low_w  = 20,
   cnt_w = high_w + low_w;
`endif

   // internal register
   reg [cnt_w-1:0] counter = 0;
   reg b = 0;

   always @( posedge clk )
   begin
      b <= busy;      
      if ( rst  ) counter <= {cnt_w{1'b0}};
      else if ( start && din != 0 ) counter <= { din-{{high_w-1{1'b0}},1'b1}, MAXC-{{low_w-1{1'b0}},1'b1} };
      else if ( counter != 0 ) 
         if ( counter[low_w-1:0] == 0 ) begin
            counter[low_w-1:0] <= MAXC-{{low_w-1{1'b0}},1'b1};
            counter[cnt_w-1:low_w] <= counter[cnt_w-1:low_w] - 1;
         end else counter <= counter - 1;
      else begin
         counter <= {cnt_w{1'b0}};
         b<=0;
      end
   end

   wire [low_w-1:0] low  = counter[low_w-1:0];
   wire [7:0]       high = counter[cnt_w-1:low_w];

   assign busy = ( counter != 0 ) | b ;

`ifdef FORMAL

   reg	f_past_valid;
   initial	f_past_valid = 1'b0;
   always @(posedge clk)
   f_past_valid <= 1'b1;

  end

`endif

endmodule