// This program was cloned from: https://github.com/leeja-j/router_tinytapeout
// License: Apache License 2.0




module router_fifo(clock,resetn,soft_reset,write_enb,read_enb,
                   lfd_state,data_in,full,empty,data_out);
  
  input clock,resetn,soft_reset;
  input write_enb,read_enb,lfd_state;
  input [2:0]data_in;
  
  output reg [2:0] data_out;
  output full,empty;
  
  reg [4:0] rd_pointer,wr_pointer;
  reg [6:0] count;
  reg [8:0] mem [15:0];

  integer i;
  
   reg lfd_state_t;
  
  always@(posedge clock)
    begin
      if(!resetn)
        lfd_state_t <= 0;
      else
        lfd_state_t <= lfd_state;
    end 
   
  // ------Read Operation-------
  always@(posedge clock) 
    begin
      if(!resetn)
          data_out = 3'b0;
      else if(soft_reset) 
          data_out = 3'bz;
      else if((read_enb) && (!empty))
        data_out = mem[rd_pointer[2:0]][2:0];
      else if(count == 0)
           data_out = 3'bz;
    end
  
  // ------Write Operation------ 
  always@(posedge clock) 
    begin
      if(!resetn || soft_reset)
         begin
            for(i=0;i<16;i=i+1)
            mem[i]<=0;
         end
      else if(write_enb&&(~full))   
         begin
           if(lfd_state_t)
	           begin
                 mem[wr_pointer[3:0]][8]<=1'b1;
                 mem[wr_pointer[2:0]][2:0]<=data_in;
	           end
      
	      else
	           begin
                 mem[wr_pointer[3:0]][8]<=1'b0;
                 mem[wr_pointer[2:0]][2:0]<=data_in;
			   end
         end
     end

      
    
  
  //----Pointer generation block----

   always@(posedge clock) 
     begin
       if(!resetn)
        wr_pointer<=0;
      else if(write_enb && (~full))
        wr_pointer<=wr_pointer+1;
     end
   
   always@(posedge clock) //Read address
     begin
       if(!resetn)
         rd_pointer<=0;
       else if(read_enb && (~empty))
         rd_pointer<=rd_pointer+1;
     end
  
  
  //-----counter block while reading------
  
  always@(posedge clock)
    begin
      if(read_enb && !empty)
        begin
          if((mem[rd_pointer[3:0]][8])==1'b1)
            count <= mem[rd_pointer[3:0]][7:2] + 1'b1;
          else if(count != 0)
            count <= count - 1'b1;
        end
    end
  //---------Full & empty condition-----------
  assign full  = (wr_pointer ==({~rd_pointer[4],rd_pointer[3:0]}));
  assign empty = (rd_pointer == wr_pointer);
  
  
endmodule
