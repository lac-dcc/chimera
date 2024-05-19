// This program was cloned from: https://github.com/RomeoMe5/DDLM
// License: MIT License

//8-bit Shift register with shift_enable

module shift_reg
#(
  parameter WIDTH=8
)
(
 input                  clk,
 input                  rst_n,
 input                  data_in,
 input                  shift_en,
 
 output reg [WIDTH-1:0] data_out,
 output                 serial_out      
 );

      
   always@(posedge clk or negedge rst_n)
     begin
        if(!rst_n)
          data_out <= {WIDTH{1'b0}};
        else if(shift_en)
          data_out <= {data_in,data_out[WIDTH-1:1]};
     end
   
   assign serial_out = data_out[0];
   
endmodule // shift_reg

