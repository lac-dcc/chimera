`timescale 1ns / 1ps
module interface_logic(

    input       [31:0]   MB_ADRESS,
    input                MB_CS,
    input                MB_RNW,
    input       [31:0]   MB_DATA_IN,
    output reg  [31:0]   MB_DATA_OUT,
    input                MB_CLK,
    input                MB_RESET,
    output               MB_RD_ACK,
    output      [31:0]   DATA_IN,
    output               USR_CLOCK,
    output               USR_RESET,
    output      [56:0]   ADDRESS_IN,
    output               INT_RD_EN,
    output               INT_WR_EN,
    input                WR_HOLD_OUT,
    input                RD_HOLD_OUT,
    input                WR_DONE,
    input       [31:0]   DATA_OUT,
    output               WR_EN,
    output               RD_EN
  );
  
  reg          mb_cs_delayed;
  reg          mb_rnw_delayed;
  reg          reset_reg ;
  wire         mb_wr_en;
  wire         mb_rd_en;
  reg  [31:0]  data_reg;
  wire [22:0]  address_reg;
  wire [31:0]  status_reg;
  reg  [31:0]  write_throughput_count;
  reg          write_throughput_count_en;
  reg  [31:0]  read_throughput_count;
  reg          read_throughput_count_en;
  reg  [31:0]  read_finish_counter;
  reg          read_finish_count_en;

  
  assign USR_CLOCK     = MB_CLK;
  assign USR_RESET     = MB_RESET | reset_reg;
  assign mb_rd_en      = MB_CS && MB_RNW;
  assign mb_wr_en      = MB_CS && !MB_RNW;
  assign ADDRESS_IN    = {34'b 0, address_reg};
  assign MB_RD_ACK     = (mb_cs_delayed && mb_rnw_delayed);
  assign status_reg[0] = RD_HOLD_OUT;
  assign status_reg[1] = WR_HOLD_OUT;
  assign status_reg[2] = WR_DONE;
  assign WR_EN         = mb_wr_en ;
  assign RD_EN         = mb_rd_en ;
    
  //delaying MB_RNW for read acknowledgement
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
  
  //MB read process
  always @(posedge MB_CLK, posedge MB_RESET)
  begin
    if (MB_RESET) begin
      MB_DATA_OUT <= 32'h 0;
    end
    else begin
      if (mb_rd_en) begin
        if(MB_ADRESS == 32'h 80F00004) begin
          MB_DATA_OUT <= status_reg;
        end
        else if(MB_ADRESS == 32'h 80F00008) begin
          MB_DATA_OUT <= write_throughput_count;
        end
        else if(MB_ADRESS == 32'h 80F0000C) begin
          MB_DATA_OUT <= read_throughput_count;
        end
        else if((MB_ADRESS >= 32'h80800000) && (MB_ADRESS < 32'h80F00000)) begin
          MB_DATA_OUT <= DATA_OUT;
        end
        else begin
          MB_DATA_OUT <= MB_DATA_OUT;
        end
      end
    end  
  end

  
  //MB Write process
  always @(posedge MB_CLK, posedge MB_RESET)
  begin
    if (MB_RESET) begin
      reset_reg <= 1'b 0;
    end
    else begin
      if (mb_wr_en) begin
        casex(MB_ADRESS)
          32'h 80F00000: begin
            reset_reg <= MB_DATA_IN[0];
          end
        endcase
      end
    end  
  end
  
  // Generating write throuhput counter enabling signal
  always @(posedge USR_CLOCK, posedge USR_RESET)
  begin
    if (USR_RESET) begin    
      write_throughput_count_en <= 1'b0;
    end
    else begin
      if (INT_WR_EN) begin
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
  always @(posedge USR_CLOCK, posedge USR_RESET)
  begin
    if (USR_RESET) begin    
      write_throughput_count  <= 32'b0;
    end
    else begin
      if (write_throughput_count_en) begin
        write_throughput_count <=  write_throughput_count +1;
      end
      else begin
        write_throughput_count <= write_throughput_count;
      end
    end
  end
  
  // Generating read finish counter enabling signal
  always @(posedge USR_CLOCK, posedge USR_RESET)
  begin
    if (USR_RESET) begin    
      read_finish_count_en <= 1'b0;
    end
    else begin
      if ((MB_ADRESS[31:20] >= 12'h808) && (MB_ADRESS[31:20] < 12'h80F)) begin
        read_finish_count_en <=  1'b1;
      end
      else if(read_finish_counter == 32'hFFF) begin
        read_finish_count_en <= 1'b0;
      end
      else begin
        read_finish_count_en <= read_finish_count_en;
      end
    end
  end

  // read finish counter process
  always @(posedge USR_CLOCK, posedge USR_RESET)
  begin
    if (USR_RESET) begin    
      read_finish_counter  <= 32'b0;
    end
    else begin
      if (INT_RD_EN) begin
        read_finish_counter <= 32'b0;
      end
      else if (read_finish_count_en && !RD_HOLD_OUT) begin
        read_finish_counter <=  read_finish_counter +1;
      end
      else begin
        read_finish_counter <=  read_finish_counter;
      end
    end
  end
  
  
  // Generating throuhput counter   enabling signal
  always @(posedge USR_CLOCK, posedge USR_RESET)
  begin
    if (USR_RESET) begin    
      read_throughput_count_en <= 1'b0;
    end
    else begin
      if (INT_RD_EN) begin
        read_throughput_count_en <=  1'b1;
      end
      else if(read_finish_counter == 12'hFFF)begin
        read_throughput_count_en <= 1'b0;
      end
      else begin
        read_throughput_count_en <= read_throughput_count_en;
      end
    end
  end
  
  // read throuhput counter process
  always @(posedge USR_CLOCK, posedge USR_RESET)
  begin
    if (USR_RESET) begin    
      read_throughput_count  <= 32'b0;
    end
    else begin
      if (read_throughput_count_en) begin
        read_throughput_count <=  read_throughput_count +1;
      end
      else if(read_finish_counter == 32'hFFF) begin
        read_throughput_count <= (read_throughput_count - 32'hFFF );
      end
      else begin
        read_throughput_count <= read_throughput_count;
      end
    end
  end
  
  assign INT_RD_EN   = ((MB_ADRESS[31:20] >= 12'h808) && (MB_ADRESS[31:20] < 12'h80F))? mb_rd_en        : 1'b0;
  assign address_reg = ((MB_ADRESS[31:20] >= 12'h800) && (MB_ADRESS[31:20] < 12'h80F))? MB_ADRESS[22:0] : 23'b0; 
  assign INT_WR_EN   = ((MB_ADRESS[31:20] >= 12'h800) && (MB_ADRESS[31:20] < 12'h808))? mb_wr_en        : 1'b0;
  assign DATA_IN     = MB_DATA_IN;
  
  
endmodule
