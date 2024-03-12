`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////
// ===========================================================================
// LG Electronics
// ===========================================================================
//  Project     : SATA Host controller
//  Title       : Implementable test bench
//  File name   : test_logic.v 
//  Note        : This is module Sata test logic and Implementable test bench 
//  Test/Verification Environment
///////////////////////////////////////////////////////////////////////////////

module TEST_LOGIC(
    input                GTX_RESET_IN,
    input                MB_CLK,
    input                MB_RESET,
    input       [31:0]   MB_ADRESS,
    input       [31:0]   MB_DATA_IN,
    input                MB_CS,
    input                MB_RNW,
    output               MB_RD_ACK,
    output reg  [31:0]   MB_DATA_OUT,

    output               SATA_CTRL_RESET_OUT, 
    output               USR_CLOCK,
    output               USR_RESET,
    output reg  [56:0]   ADDRESS_IN,
    output reg  [31:0]   DATA_IN,
    output reg           RD_EN_IN,
    output reg           WR_EN_IN,
    input                WR_HOLD_OUT,
    input                RD_HOLD_OUT,
    input                WR_DONE,
    input       [31:0]   DATA_OUT
  );
   
  reg      [2 :0]   state;
  reg      [31:0]   iteration_count; 
  reg               cmd_complete;
  reg      [31:0]   exp_data;
  reg               first_read_en;
  reg      [31:0]   throughput_count;
  reg               cmp_error;
  reg               mb_cs_delayed;
  reg               mb_rnw_delayed;
  reg      [ 3:0]   cmd_reg;
  reg      [31:0]   init_data;
  reg               sata_ctrl_reset_reg; 
  reg      [31:0]   total_iteration;
  reg      [63:0]   write_throughput_count;
  reg               write_throughput_count_en;
  reg      [63:0]   read_throughput_count;
  reg               read_throughput_count_en;
  reg               data_reg_en;
  reg               USR_RESET_int;
 
  wire     [31:0]   data_reg; 
  wire     [31:0]   status_reg;
  reg               cmd_enable; 
  //wire              user_reset_int_count_en;
  reg      [1:0]    user_reset_int_count;
  reg      [31:0]   expected_data_reg;
  reg      [31:0]   read_data_reg;

  parameter      WAIT_FOR_CMD        = 3'b000;
  parameter      USER_RESET1         = 3'b001;
  parameter      CHECK_WR_HOLD       = 3'b010;
  parameter      WRITE_OPERATION     = 3'b011;
  parameter      WR_DONE_CHECK       = 3'b100;
  parameter      USER_RESET2         = 3'b101;
  parameter      FIRST_READ          = 3'b110;  
  parameter      READ_OPERATION      = 3'b111;  

  parameter      BUFFER_MAX          = 16'hFFFC;

  assign MB_RD_ACK            = (mb_cs_delayed && mb_rnw_delayed);  
  assign USR_CLOCK            = MB_CLK;
  assign USR_RESET            = (MB_RESET || USR_RESET_int);
  assign SATA_CTRL_RESET_OUT  = (GTX_RESET_IN || sata_ctrl_reset_reg);

  assign status_reg[0]   = cmd_enable;
  assign status_reg[1]   = cmp_error;
 
  assign FIRST_ADDR      = 57'b 0;

  //delaying MB_RNW for read acknowledgemen 
  always @(posedge MB_CLK, posedge MB_RESET)
  begin
    if (MB_RESET) begin
      mb_rnw_delayed <= 1'b 0;
      mb_cs_delayed  <= 1'b 0; 
    end
    else begin
      mb_rnw_delayed <= MB_RNW;
      mb_cs_delayed  <= MB_CS;
    end
  end
  
  //Reading status reg and throughput count
  always @(posedge MB_CLK, posedge MB_RESET) 
  begin
    if (MB_RESET) begin
      MB_DATA_OUT <= 32'h 0;
    end
    else begin
      if (MB_CS && MB_RNW) begin
        casex(MB_ADRESS[23:0])
          24'h 000000: begin
            MB_DATA_OUT <= {31'b0,sata_ctrl_reset_reg};
          end 
          24'h 100000: begin
            MB_DATA_OUT <= total_iteration;
          end
          24'h 100004: begin
            MB_DATA_OUT <= {28'b0,cmd_reg};
          end 
          24'h 100008: begin
            MB_DATA_OUT <= status_reg;
          end
          24'h 10000C: begin
            MB_DATA_OUT <= write_throughput_count[31:0];
          end
          24'h 100010: begin
            MB_DATA_OUT <= write_throughput_count[63:32];
          end
          24'h 100014: begin
            MB_DATA_OUT <= iteration_count;
          end 
          24'h 100018: begin
            MB_DATA_OUT <= {31'b0,cmd_complete};
          end 
          24'h 10001C: begin
            MB_DATA_OUT <= init_data;
          end 
          24'h 100020: begin
            MB_DATA_OUT <= read_throughput_count[31:0];
          end
          24'h 100024: begin
            MB_DATA_OUT <= read_throughput_count[63:32];
          end
          24'h 100028: begin
            MB_DATA_OUT <= expected_data_reg;
          end
          24'h 10002C: begin
            MB_DATA_OUT <= read_data_reg;
          end
          default: begin
            MB_DATA_OUT <= MB_DATA_OUT;
          end
        endcase
      end
      else begin
        MB_DATA_OUT <= MB_DATA_OUT;
      end
    end  
  end

  //MB Write process
  always @(posedge MB_CLK, posedge MB_RESET)
  begin
    if (MB_RESET) begin
      total_iteration     <= 32'h 1;
      cmd_reg             <=  1'b 0;
      sata_ctrl_reset_reg <=  1'b 0;
      init_data           <= 32'b 0;
    end
    else begin
      if (MB_CS && !MB_RNW) begin
        casex(MB_ADRESS[23:0])
          24'h 000000: begin
            sata_ctrl_reset_reg <= MB_DATA_IN[0];
          end 
          24'h 100000: begin
            total_iteration <= MB_DATA_IN[31:0];
          end
          24'h 100004: begin
            cmd_reg         <= MB_DATA_IN[3:0];
          end
          24'h 10001C: begin
            init_data       <=  MB_DATA_IN;
          end           
        endcase
      end
    end  
  end
  
  //Generating command enable (cmd_enable)
  always @(posedge MB_CLK, posedge MB_RESET)
  begin
    if (MB_RESET) begin
      cmd_enable <= 1'b0;
    end
    else begin
      if ((MB_ADRESS == 24'h10_0004) && (MB_CS && !MB_RNW)) begin
        cmd_enable <= 1'b1;
      end
      else if (((state == READ_OPERATION) && (iteration_count == total_iteration))||(cmp_error)) begin
        cmd_enable <= 1'b0;
      end
      else begin 
        cmd_enable <= cmd_enable;
      end
    end  
  end
  
  //for command_complete
  always @(posedge MB_CLK, posedge MB_RESET)
  begin
    if (MB_RESET) begin
      cmd_complete <= 1'b0;
    end
    else begin
      if ((MB_ADRESS == 24'h10_0004) && (MB_CS && !MB_RNW)) begin
        cmd_complete <= 1'b0;
      end
      else if ((state == READ_OPERATION) && (iteration_count == total_iteration)) begin
        cmd_complete <= 1'b1;
      end
      else begin
        cmd_complete <= cmd_complete;
      end
    end  
  end
  
  //Below two process are used to elongate USR_RESET signal
  /*
  always @(posedge USR_CLOCK, posedge MB_RESET)
  begin
    if (MB_RESET) begin
      user_reset_int_count_en <= 1'b0;
    end 
    else if (USR_RESET_int) begin
      user_reset_int_count_en <= 1'b1;
    end
    else if(user_reset_int_count == 2'b11) begin
      user_reset_int_count_en <= 1'b0;
    end
    else begin
      user_reset_int_count_en <= user_reset_int_count_en;
    end
  end
  */
  //assign user_reset_int_count_en = (USR_RESET_int && (user_reset_int_count < 2'b11)) ? 1 : 0;
  
  always @(posedge USR_CLOCK, posedge MB_RESET)
  begin
    if (MB_RESET) begin
      user_reset_int_count <= 2'b00;
    end 
    else if (USR_RESET_int) begin
      user_reset_int_count <= user_reset_int_count +1;
    end
    else begin
      user_reset_int_count <= 2'b00;
    end
  end

 // Main state machine
  always @ (posedge MB_CLK, posedge MB_RESET) 
  begin
    if(MB_RESET) begin
      ADDRESS_IN      <= 57'b 0;
      DATA_IN         <= init_data;
      WR_EN_IN        <=  1'b 0;
      RD_EN_IN        <=  1'b 0;
      iteration_count <= 32'b 0;
      state           <= WAIT_FOR_CMD;
      first_read_en   <=  1'b 0;
      USR_RESET_int   <= 1'b0;
    end
    else begin
      case (state)
        
        WAIT_FOR_CMD  : begin
          if (cmd_enable)begin
            if ((cmd_reg == 4'b0001) && (total_iteration != 32'b0)) begin
              state           <= USER_RESET1;
              USR_RESET_int   <= 1'b1;
              ADDRESS_IN      <= 57'b0;
              DATA_IN         <= init_data;
              iteration_count <= 32'b 0;

            end
            else begin 
              state <= WAIT_FOR_CMD;
            end
          end            
        end
        
        USER_RESET1: begin
          if(user_reset_int_count == 2'b11) begin
            USR_RESET_int   <= 1'b0;
            iteration_count <= 32'b0;
            DATA_IN         <= init_data;
            state           <= CHECK_WR_HOLD;
          end
          else begin
            USR_RESET_int   <= 1'b1;
            state           <= USER_RESET1;
          end
        end
  
        CHECK_WR_HOLD : begin
          if (WR_HOLD_OUT) begin
            state      <= CHECK_WR_HOLD;
            WR_EN_IN   <= 1'b 0;
          end
          else if (iteration_count == total_iteration) begin
            state           <= WR_DONE_CHECK;
            WR_EN_IN        <=  1'b 0; 
            ADDRESS_IN      <= 57'b 0;
            DATA_IN         <= init_data;
          end            
          else if (iteration_count < total_iteration)begin
            state      <= WRITE_OPERATION;
            WR_EN_IN   <= 1'b 1;
          end
          else begin
            state      <= state;
            WR_EN_IN   <= WR_EN_IN;            
          end
        end 
        
        WRITE_OPERATION : begin
          if (ADDRESS_IN [15:0] < BUFFER_MAX) begin            //checking buffer full during write
            WR_EN_IN        <=  1'b 1;
            ADDRESS_IN      <= ADDRESS_IN + 3'b 100;
            DATA_IN         <= DATA_IN + 1;
            state           <= WRITE_OPERATION;
            iteration_count <= iteration_count;
          end
          else if (ADDRESS_IN [15:0] == BUFFER_MAX) begin      //checking buffer full during write
            
            iteration_count <= iteration_count + 1;
            WR_EN_IN        <=  1'b 0;
            if (iteration_count == (total_iteration - 1)) begin
              state           <= WR_DONE_CHECK;
              ADDRESS_IN      <= 57'b 0;
              DATA_IN         <= init_data;
            end
            else begin
              state           <= CHECK_WR_HOLD;
              ADDRESS_IN      <= ADDRESS_IN + 3'b 100;
              DATA_IN         <= DATA_IN +1;
            end
          end
          else begin
            ADDRESS_IN      <= ADDRESS_IN;
            DATA_IN         <= DATA_IN;
            WR_EN_IN        <= 1'b0; 
            state           <= state;
            iteration_count <= iteration_count ;
          end
        end  

        WR_DONE_CHECK : begin                          //checking write done      
          if(WR_DONE)begin
            state           <= USER_RESET2;
            USR_RESET_int   <= 1'b1;
          end
          else begin
            state           <= WR_DONE_CHECK;
          end
        end

        USER_RESET2: begin
          if(user_reset_int_count == 2'b11) begin
            USR_RESET_int   <= 1'b0;
            iteration_count <= 32'b0;
            state           <= FIRST_READ;
          end
          else begin
            state           <= USER_RESET2;
          end
        end
        
        FIRST_READ : begin
          if (RD_HOLD_OUT) begin  
            state           <= FIRST_READ;
            data_reg_en     <= 1'b0;
          end   
          else if(!RD_HOLD_OUT && !first_read_en)begin 
            ADDRESS_IN      <= FIRST_ADDR;                //first address for read
            RD_EN_IN        <= 1'b 1;
            first_read_en   <= 1'b 1;  
            state           <= FIRST_READ;
            data_reg_en     <= 1'b0;
          end          
          else if (!RD_HOLD_OUT && first_read_en)begin
            first_read_en   <= 1'b 0;  
            RD_EN_IN        <= 1'b 1;
            state           <= READ_OPERATION;
            data_reg_en     <= 1'b0;
          end  
          else begin
            RD_EN_IN        <= RD_EN_IN;
            ADDRESS_IN      <= ADDRESS_IN ;
            first_read_en   <= first_read_en;
            state           <= state;
            data_reg_en     <= data_reg_en;
          end
        end

        READ_OPERATION : begin
          if (iteration_count == total_iteration) begin      
            ADDRESS_IN     <= 57'b 0 ;
            RD_EN_IN       <=  1'b 0;
            state          <= WAIT_FOR_CMD;
            data_reg_en    <=  1'b 0;
          end
          else if (RD_HOLD_OUT) begin
            state        <= READ_OPERATION;
            data_reg_en  <= 1'b 0;
          end
          else if(cmp_error) begin
            state        <= WAIT_FOR_CMD;
            RD_EN_IN     <= 1'b 0;
            data_reg_en  <= 1'b 0;
          end
          else if (iteration_count < total_iteration) begin
            ADDRESS_IN <= ADDRESS_IN + 3'b 100;
            state      <= READ_OPERATION;
            if (ADDRESS_IN [15:0] == BUFFER_MAX) begin           //checking buffer full during read                
              RD_EN_IN        <= 1'b 1; 
              data_reg_en     <= 1'b 1;
              iteration_count <= iteration_count + 1;
            end
            else if (ADDRESS_IN [15:0] < BUFFER_MAX) begin            
              RD_EN_IN        <= 1'b 1;
              data_reg_en     <= 1'b 1;
            end
            else begin
              ADDRESS_IN      <= ADDRESS_IN;
              RD_EN_IN        <= 1'b 0; 
              data_reg_en     <= 1'b 0;
            end
          end
          else begin
            ADDRESS_IN    <= ADDRESS_IN ;
            RD_EN_IN      <= RD_EN_IN;
            state         <= READ_OPERATION;
            data_reg_en   <= 1'b 0;
          end
        end
      endcase
    end
  end

//reading data from SSD to data reg and compairing with expected data
 assign data_reg  = data_reg_en ? DATA_OUT : 32'b 0;

  always @ (posedge MB_CLK, posedge MB_RESET) 
  begin
    if (MB_RESET) begin
      exp_data          <= init_data;
      cmp_error         <= 1'b 0;
      expected_data_reg <= 32'h0;
      read_data_reg     <= 32'h0;
    end
    else begin
      if (USR_RESET_int) begin
        exp_data        <= init_data;
        cmp_error       <= 1'b 0;
      end
      else if ((MB_ADRESS == 24'h10_0004) && (MB_CS && !MB_RNW)) begin
        exp_data        <= init_data;
        cmp_error       <= 1'b 0;
      end
      else if(data_reg_en) begin
        if ((data_reg == exp_data) && (cmp_error == 1'b0)) begin                   
          exp_data        <= exp_data + 1;
          cmp_error       <= 1'b 0;
        end
        else begin
          exp_data          <= exp_data ;
          cmp_error         <= 1'b 1;   
          expected_data_reg <= exp_data;
          read_data_reg     <= data_reg;
        end
      end
      else begin
        exp_data        <= exp_data ;
        cmp_error       <= cmp_error;  
      end
    end
  end

  
  // Generating write throuhput counter enabling signal
  always @(posedge MB_CLK, posedge MB_RESET)
  begin
    if (MB_RESET) begin    
      write_throughput_count_en <= 1'b0;
    end
    else begin
      if (WR_EN_IN) begin
        write_throughput_count_en <=  1'b1;
      end
      else if (WR_DONE) begin
        write_throughput_count_en <= 1'b0;
      end
      else begin
        write_throughput_count_en <= write_throughput_count_en;
      end
    end
  end
  
  // write throuhput counter process
  always @(posedge MB_CLK, posedge MB_RESET)
  begin
    if (MB_RESET) begin    
      write_throughput_count  <= 64'b0;
    end
    else begin
      if (write_throughput_count_en) begin
        write_throughput_count <=  write_throughput_count +1;
      end
      else if ((state == WAIT_FOR_CMD) && (cmd_enable) && (cmd_reg == 4'b0001)) begin
        write_throughput_count <=  64'b0;
      end
      else begin
        write_throughput_count <= write_throughput_count;
      end
    end
  end
   
  // Generating throuhput counter   enabling signal
  always @(posedge MB_CLK, posedge MB_RESET)
  begin
    if (MB_RESET) begin    
      read_throughput_count_en <= 1'b0;
    end
    else begin
      if (RD_EN_IN) begin
        read_throughput_count_en <=  1'b1;
      end
      else if(cmd_complete ||(cmp_error))begin
        read_throughput_count_en <= 1'b0;
      end
      else begin
        read_throughput_count_en <= read_throughput_count_en;
      end
    end
  end
  
  // read throuhput counter process
  always @(posedge MB_CLK, posedge MB_RESET)
  begin
    if (MB_RESET) begin    
      read_throughput_count  <= 64'b0;
    end
    else if (read_throughput_count_en) begin
      read_throughput_count <=  read_throughput_count +1;
    end
    else if ((state == WAIT_FOR_CMD) && (cmd_enable) && (cmd_reg == 4'b0001)) begin
      read_throughput_count <=  64'b0;
    end
    else begin
      read_throughput_count <= read_throughput_count;
    end
  end
  
endmodule