//**********************************************************

// Author: Luo Tian, copyright 2020

// e-mail: luotian12345@sjtu.edu.cn

// School: Shanghai Jiao Tong University

//

// File Name: p_s

//

// Type: Sequential

//

// Purpose: <Specific Function Description>

// 

//

// Details: Convert parallel output to series output.

//

//

// Release History:

// - Version 1.0 20/03/27: Create;

// - Version 1.1 20/02/20: Modify;

// - Version 1.2 20/04/21: Edit format by @VenciFreeman;

// - Version 1.3 20/04/21: Delete next_1 and next_2.

//

// Notes:

//

//**********************************************************



module p_s(

  input  wire         clk,

  input  wire         rst_n,

  input  wire [135:0] data_in_3,

  input  wire         p_s_flag_in,

  output reg  [33:0]  data_out_3

  );

  

  reg [33:0] R0;

  reg [33:0] R1;

  reg [33:0] R2;

  reg [33:0] R3;

  reg [33:0] R4;

  reg [33:0] R5;

  reg [33:0] R6;

  reg [33:0] R7;

  reg [33:0] R8;

  reg [33:0] R9;

  reg [33:0] R10;

  reg [33:0] R11;

  reg [33:0] R12;

  reg [33:0] R13;

  reg [33:0] R14;

  reg [33:0] R15;



  reg [1:0]  counter_1;

  reg [3:0]  counter_2;

  reg        p_s_flag_out;

  

// This always part controls signal counter_1. 

  always @ ( posedge clk or negedge rst_n ) begin

    if ( !rst_n )

      counter_1 <= 2'b0;

    else if ( counter_1 == 2'b11 )

      counter_1 <= 2'b0;

    else

      counter_1 <= counter_1 + 2'b01;

  end



// This always part controls registers. 

  always @ ( posedge clk ) begin

    if ( !p_s_flag_in ) begin

      case ( counter_1 )

        2'b10: begin

          R0  <= data_in_3[33:0];

          R4  <= data_in_3[67:34];

          R8  <= data_in_3[101:68];

          R12 <= data_in_3[135:102];

      end

      2'b11: begin

          R1  <= data_in_3[33:0];

          R5  <= data_in_3[67:34];

          R9  <= data_in_3[101:68];

          R13 <= data_in_3[135:102];

      end

      2'b00: begin

          R2  <= data_in_3[33:0];

          R6  <= data_in_3[67:34];

          R10 <= data_in_3[101:68];

          R14 <= data_in_3[135:102];

      end

      2'b01: begin

          R3  <= data_in_3[33:0];

          R7  <= data_in_3[67:34];

          R11 <= data_in_3[101:68];

          R15 <= data_in_3[135:102];

      end

      endcase

    end

  end



// This always part controls signal counter_2. 

  always @ ( posedge clk or negedge rst_n ) begin

    if ( !rst_n )

      counter_2 <= 4'b0;

    else if ( counter_2 == 4'b1111 )

      counter_2 <= 4'b0;

    else

      counter_2 <= counter_2 + 4'b0001;

  end



// This always part controls p_s_flag_out. 

  always @ ( posedge clk or negedge rst_n ) begin

     if ( !rst_n )

      p_s_flag_out <= 1'b0;

     else if ( !p_s_flag_in ) 

      p_s_flag_out <= 1'b1;

     else

      p_s_flag_out <= p_s_flag_out;

  end



// This always part controls data_out_3.          

  always @ ( posedge clk ) begin

    if ( p_s_flag_out ) begin

      case( counter_2 )

        4'b0000: data_out_3 <= R7;

        4'b0001: data_out_3 <= R11;

        4'b0010: data_out_3 <= R15;

        4'b0011: data_out_3 <= R0;

        4'b0100: data_out_3 <= R4;

        4'b0101: data_out_3 <= R8;

        4'b0110: data_out_3 <= R12;

        4'b0111: data_out_3 <= R1;

        4'b1000: data_out_3 <= R5;

        4'b1001: data_out_3 <= R9;

        4'b1010: data_out_3 <= R13;

        4'b1011: data_out_3 <= R2;

        4'b1100: data_out_3 <= R6;

        4'b1101: data_out_3 <= R10;

        4'b1110: data_out_3 <= R14;

        4'b1111: data_out_3 <= R3;

      endcase

    end

  end

   

endmodule
