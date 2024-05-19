// This program was cloned from: https://github.com/stevenbell/csirx
// License: GNU Lesser General Public License v3.0

/* Align two data channels based on their sync signals, so that each 16-bit
 * output word has a corresponding byte from each channel, and the whole word
 * becomes valid/invalid at the same time.
 *
 * This is loosely based on David Shah's work:
 * https://github.com/daveshah1/CSI2Rx/blob/master/mipi-csi-rx/csi_rx_word_align.vhd
 *
 * Steven Bell <sebell@stanford.edu>
 * 2 January 2018
 */

module wordalign # (
  parameter integer MAX_CHANNEL_DELAY = 2
)
(
  input wire clk,
  input wire resetn,
  // We just use the valid line to generate the sync
  input wire dl0_rxvalidhs, // Lane 0 valid
  input wire dl1_rxvalidhs, // Lane 1 valid
  input wire [7:0] dl0_rxdatahs, // Lane 0 data
  input wire [7:0] dl1_rxdatahs, // Lane 1 data
  output wire [15:0] word_out, // { lane 0[7:0], lane 1[7:0] }
  output reg word_valid
);

  // Delayed copies of the input word, which is the concatenation of the input bytes
  reg[15:0] word_delay[MAX_CHANNEL_DELAY+1:0];
  // Delayed copies of the sync lines, which form a set of one-hot delay counters
  reg[1:0] sync_delay[MAX_CHANNEL_DELAY+1:0];
  // Delayed copies of the valid bits, so the output invalidation is synced
  reg[1:0] valid_delay[MAX_CHANNEL_DELAY+1:0];

  wire locked; // Whether we have aquired a sync pulse from all channels
  reg[7:0] byte_lane0;
  reg[7:0] byte_lane1;

  integer i; // Loop counter

  always @(posedge clk) begin
    if(~resetn) begin
      byte_lane0 <= 0;
      byte_lane1 <= 0;
      for(i = 0; i <= MAX_CHANNEL_DELAY; i = i+1) begin
        word_delay[i] <= 0;
        sync_delay[i] <= 2'b00;
        valid_delay[i] <= 2'b00;
      end
      word_valid <= 1'b0;
    end
    else begin
      // Push the incoming data and valid bits down the chain
      word_delay[0] <= {dl0_rxdatahs, dl1_rxdatahs};
      word_delay[1] <= word_delay[0];
      word_delay[2] <= word_delay[1];

      valid_delay[0] <= {dl0_rxvalidhs, dl1_rxvalidhs};
      valid_delay[1] <= valid_delay[0];
      valid_delay[2] <= valid_delay[1];
  
      // If we haven't yet gotten a sync from all the channels,
      // then keep pushing them back.
      // Once we have a sync from each channel, the position of those bits
      // represents the delay that we need to apply to each data stream.
      if(~locked) begin
        sync_delay[0] <= {dl0_rxvalidhs != valid_delay[0][1],
                          dl1_rxvalidhs != valid_delay[0][0]};
        sync_delay[1] <= sync_delay[0];
        sync_delay[2] <= sync_delay[1];
      end

      // Output is valid one cycle after locking
      word_valid <= locked;

      // Select the appropriate bytes from the delay chain based on the sync delays
      if(sync_delay[0][1])
        byte_lane0 <= word_delay[0][15:8];
      else if(sync_delay[1][1])
        byte_lane0 <= word_delay[1][15:8];
      else if(sync_delay[2][1])
        byte_lane0 <= word_delay[2][15:8];
      else
        byte_lane0 <= 0;
      
      if(sync_delay[0][0])
        byte_lane1 <= word_delay[0][7:0];
      else if(sync_delay[1][0])
        byte_lane1 <= word_delay[1][7:0];
      else if(sync_delay[2][0])
        byte_lane1 <= word_delay[2][7:0];
      else
        byte_lane1 <= 0;
    end // else (~reset)
  end

  // We're locked (i.e., have a valid set of delays in sync_delay) if each
  // lane has a sync pulse, and the corresponding valid bit is set (to handle desync)
  // This is a continuous assignment since we need to stop the sync on the next cycle
  assign locked = ((sync_delay[0][0] & valid_delay[0][0]) | 
                   (sync_delay[1][0] & valid_delay[1][0]) | 
                   (sync_delay[2][0] & valid_delay[2][0])) &
                  ((sync_delay[0][1] & valid_delay[0][1]) | 
                   (sync_delay[1][1] & valid_delay[1][1]) | 
                   (sync_delay[2][1] & valid_delay[2][1]));
 
  assign word_out = {byte_lane0, byte_lane1};

endmodule

