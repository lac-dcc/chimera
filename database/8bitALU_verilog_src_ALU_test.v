// This program was cloned from: https://github.com/EdricOngKhaiJieh/8bitALU_verilog
// License: Apache License 2.0

module tt_um_8bitALU (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // will go high when the design is enabled
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
  );
  

reg [7:0] memory3 ; 

  
//  always @(posedge clk) 
//   begin
//     if (rst_n) begin
//     // Reset memory to default values
//     memory3 <= 8'd0;
//   end
//     else if (ena) begin
//     if(ui_in[7] == 0 && ui_in[6] == 0 )
//         begin

//               memory3 <= (ui_in[2:0] + ui_in[5:3]);            
//         end
        
//     if(ui_in[7] == 0 && ui_in[6] == 1)
//         begin

//               memory3 <= (ui_in[2:0] - ui_in[5:3]);  
//         end
        
//     if(ui_in[7] == 1 && ui_in[6] == 0 )
//         begin

//               memory3 <= (ui_in[2:0] * ui_in[5:3]);  
//         end
        
//     if(ui_in[7] == 1 && ui_in[6] == 1)
//         begin

//               memory3 <= (ui_in[2:0] / ui_in[5:3]);  
//         end
        


//     end
// end


//   assign uo_out  = memory3 ; 
//   assign uio_out = 0;
//   assign uio_oe  = 0;
// endmodule 
always @(posedge clk) 
  begin
    if (rst_n) begin
    // Reset memory to default values
    memory3 <= 8'd0;
  end
    else if (ena) begin
    if(ui_in[7] == 0 && ui_in[6] == 0 )
        begin

              memory3 <= ({5'b0,ui_in[2:0]} + {5'b0,ui_in[5:3]});            
        end
        
    if(ui_in[7] == 0 && ui_in[6] == 1)
        begin

              memory3 <= ({5'b0,ui_in[2:0]} - {5'b0,ui_in[5:3]});
        end
    if(ui_in[7] == 1 && ui_in[6] == 0 )
        begin

              memory3 <= ({5'b0,ui_in[2:0]} * {5'b0,ui_in[5:3]}); 
        end
        
    if(ui_in[7] == 1 && ui_in[6] == 1)
        begin

              memory3 <= ({5'b0,ui_in[2:0]} / {5'b0,ui_in[5:3]});
        end
        


    end
end


  assign uo_out  = memory3 ; 
  assign uio_out = 0;
  assign uio_oe  = 0;
endmodule
