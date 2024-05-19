// This program was cloned from: https://github.com/combinatorylogic/soc
// License: MIT License

// Taken from:
// http://electrosofts.com/verilog/fifo.html


`define BUF_WIDTH 4    // BUF_SIZE = 16 -> BUF_WIDTH = 4, no. of bits to be used in pointer
`define BUF_SIZE ( 1<<`BUF_WIDTH )


module fifo(input             clk,
            input             reset,

            input [31:0]      data_in,
            input             data_in_wr,
            
            output reg [31:0] data_out,
            input             data_out_en,

            output reg        full,
            output reg        empty
            );

   parameter DEBUG = 0;
   

   reg [`BUF_WIDTH :0]        fifo_counter;
   reg [`BUF_WIDTH -1:0]      rd_ptr, wr_ptr;           // pointer to read and write addresses  
   reg [31:0]                 buf_mem[`BUF_SIZE -1 : 0]; //  

   always @(fifo_counter)
     begin
        empty = (fifo_counter==0);
        full = (fifo_counter== `BUF_SIZE);
     end

   always @(posedge clk)
     begin
        if( !reset )
          fifo_counter <= 0;

        else if( (!full && data_in_wr) && 
                 ( !empty && data_out_en ) )
          fifo_counter <= fifo_counter;

        else if( !full && data_in_wr )
          fifo_counter <= fifo_counter + 1;

        else if( !empty && data_out_en )
          fifo_counter <= fifo_counter - 1;
        else
          fifo_counter <= fifo_counter;
     end

   always @( posedge clk)
     begin
        if( !reset )
          data_out <= 0;
        else
          begin
             if( data_out_en && !empty ) begin
                if (DEBUG)
                  $display("FIFO OUT -> [%x]",  buf_mem[rd_ptr]);
                data_out <= buf_mem[rd_ptr];
             end
             else
               data_out <= data_out;
          end
     end

   always @(posedge clk)
     begin
        
        if( data_in_wr && !full ) begin
           if(DEBUG)
             $display("FIFO IN <- [%x]", data_in);
          buf_mem[ wr_ptr ] <= data_in;
        end
        
        else
          buf_mem[ wr_ptr ] <= buf_mem[ wr_ptr ];
     end
   
   always@(posedge clk)
     begin
        if( !reset )
          begin
             wr_ptr <= 0;
             rd_ptr <= 0;
          end
        else
          begin
             if( !full && data_in_wr )    wr_ptr <= wr_ptr + 1;
             else  wr_ptr <= wr_ptr;
             
             if( !empty && data_out_en )   rd_ptr <= rd_ptr + 1;
             else rd_ptr <= rd_ptr;
          end
     end
endmodule
