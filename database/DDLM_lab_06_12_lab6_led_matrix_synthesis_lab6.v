// This program was cloned from: https://github.com/RomeoMe5/DDLM
// License: MIT License

module de10_lite 
(
 input        CLOCK_50,
 input [1:0]  KEY,
 inout [35:0] GPIO 
);

  reg [15:0]  matrix;
  wire [7:0]  rows,cols;
  wire        push_button;
  wire        shift_cols;
  wire        shift_rows;
   
  assign push_button = ~KEY[1];
   
  always@(posedge CLOCK_50)
    matrix = {
              ~rows[0],~rows[1], cols[1],~rows[7],
               cols[3],~rows[2], cols[0],~rows[4],
               cols[4], cols[6],~rows[6],~rows[5],
               cols[7],~rows[3], cols[5], cols[2]
             };
   
  assign {
          GPIO[24],GPIO[22],GPIO[20],GPIO[18],
          GPIO[16],GPIO[14],GPIO[12],GPIO[10],
          GPIO[25],GPIO[23],GPIO[21],GPIO[19],
          GPIO[17],GPIO[15],GPIO[13],GPIO[11]
         } = matrix;
   
  strobe_gen #(.div(24)) strobe_rows
    (
     .clk    ( CLOCK_50      ),
     .rst_n  ( KEY[0]        ),
     .strobe ( shift_rows    )
    );
   
  strobe_gen #(.div(24)) strobe_cols
    (
     .clk    ( CLOCK_50      ),
     .rst_n  ( KEY[0]        ),
     .strobe ( shift_cols    )
    );

  shift_reg #(.WIDTH(8)) s_rows
    (
     .clk      ( CLOCK_50      ),
     .rst_n    ( KEY[0]        ),
     .data_in  ( push_button   ),
     .shift_en ( shift_rows    ),
     .data_out ( rows          ),
     .serial_out ()
    );
   
  shift_reg #(.WIDTH(8)) s_cols
    (
     .clk      ( CLOCK_50      ),
     .rst_n    ( KEY[0]        ),
     .data_in  ( push_button   ),
     .shift_en ( shift_cols    ),
     .data_out ( cols          ),
     .serial_out()
    );   

endmodule // de10_lite
