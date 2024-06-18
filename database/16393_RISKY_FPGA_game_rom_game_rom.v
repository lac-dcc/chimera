// This program was cloned from: https://github.com/chicken8848/RISKY
// License: MIT License

module game_rom(
    input clk,
    input [31:0] ia,
    output reg [31:0] game_data
  );
  
  always@(*) begin
    case(ia)
      32'h00: game_data <= 32'h40000113; // stack addi x2, x0, 1024
      32'h04: game_data <= 32'h00000413; // fp addi x8, x0, 0
      32'h08: game_data <= 32'h00000093; // ra addi x1, x0, 0
32'hc: game_data <= 32'hfe010113;
32'h10: game_data <= 32'h00812e23;
32'h14: game_data <= 32'h02010413;
32'h18: game_data <= 32'hfe042623;
32'h1c: game_data <= 32'h05c0006f;
32'h20: game_data <= 32'hfe042423;
32'h24: game_data <= 32'h03c0006f;
32'h28: game_data <= 32'h100006b7;
32'h2c: game_data <= 32'hfec42703;
32'h30: game_data <= 32'h00070793;
32'h34: game_data <= 32'h00279793;
32'h38: game_data <= 32'h00e787b3;
32'h3c: game_data <= 32'h00779793;
32'h40: game_data <= 32'h00f68733;
32'h44: game_data <= 32'hfe842783;
32'h48: game_data <= 32'h00f707b3;
32'h4c: game_data <= 32'hfff00713;
32'h50: game_data <= 32'h00e78023;
32'h54: game_data <= 32'hfe842783;
32'h58: game_data <= 32'h00178793;
32'h5c: game_data <= 32'hfef42423;
32'h60: game_data <= 32'hfe842703;
32'h64: game_data <= 32'h27f00793;
32'h68: game_data <= 32'hfce7d0e3;
32'h6c: game_data <= 32'hfec42783;
32'h70: game_data <= 32'h00178793;
32'h74: game_data <= 32'hfef42623;
32'h78: game_data <= 32'hfec42703;
32'h7c: game_data <= 32'h1df00793;
32'h80: game_data <= 32'hfae7d0e3;
32'h84: game_data <= 32'hf95ff06f;
      

      default: game_data <= 32'h0;
    endcase
  end
endmodule
