// This program was cloned from: https://github.com/leeja-j/router_tinytapeout
// License: Apache License 2.0



module router_fsm(clock,resetn,pkt_valid,data_in,fifo_full,fifo_empty_0,fifo_empty_1,fifo_empty_2,
                  soft_reset_0,soft_reset_1,soft_reset_2,parity_done,low_packet_valid,
                  write_enb_reg,detect_add,ld_state,laf_state,lfd_state,full_state,rst_int_reg,busy);

input clock,resetn,pkt_valid,fifo_full,fifo_empty_0,fifo_empty_1,fifo_empty_2;
input soft_reset_0,soft_reset_1,soft_reset_2,parity_done,low_packet_valid;
input [1:0] data_in;
output write_enb_reg,detect_add,ld_state,laf_state,lfd_state,full_state,rst_int_reg,busy;
  
  
parameter DECODE_ADDRESS     = 3'b000,
          LOAD_FIRST_DATA 	 = 3'b001,
          LOAD_DATA 		 = 3'b010,
          WAIT_TILL_EMPTY 	 = 3'b011,
          CHECK_PARITY_ERROR = 3'b100,
          LOAD_PARITY 		 = 3'b101,
          FIFO_FULL_STATE 	 = 3'b110,
          LOAD_AFTER_FULL 	 = 3'b111;
  
  reg [2:0] PS,NS;
          
  always@(posedge clock)
    begin
      if(!resetn)
        PS <= DECODE_ADDRESS;
      else if(soft_reset_0 || soft_reset_1 || soft_reset_2)
        PS <= DECODE_ADDRESS;
      else 
        PS <= NS;
    end
  
  
  always@(*)
    begin
      NS = DECODE_ADDRESS;
      case(PS)
        
        DECODE_ADDRESS : 
                  begin
                    if((pkt_valid && (data_in[1:0]==0) && fifo_empty_0)||
                       (pkt_valid && (data_in[1:0]==1) && fifo_empty_1)||
                       (pkt_valid && (data_in[1:0]==2) && fifo_empty_2))
                      
                      NS = LOAD_FIRST_DATA;
                    
                    else if((pkt_valid && (data_in[1:0]==0) && (~fifo_empty_0))||
                            (pkt_valid && (data_in[1:0]==1) && (~fifo_empty_1))||
                            (pkt_valid && (data_in[1:0]==2) && (~fifo_empty_2)))
                      
                      NS = WAIT_TILL_EMPTY;
                    
                    else
                      NS = DECODE_ADDRESS;
                  end
        
        LOAD_FIRST_DATA :  NS = LOAD_DATA;
        
        LOAD_DATA       : 
                        begin
			      			if(fifo_full)
				 				NS=FIFO_FULL_STATE;
                          else if(!fifo_full && !pkt_valid)
				 				NS=LOAD_PARITY;
			      			else
				 				NS=LOAD_DATA;
			   			end 
        
        WAIT_TILL_EMPTY  : 
                        begin
                          if((!fifo_empty_0) || (!fifo_empty_1) || (!fifo_empty_2))
				 			NS=WAIT_TILL_EMPTY;
			      		  else if(fifo_empty_0||fifo_empty_1||fifo_empty_2)
				 			NS=LOAD_FIRST_DATA;
			      		  else
				 			NS=WAIT_TILL_EMPTY;
                         end
        
        CHECK_PARITY_ERROR:
          				begin
			    			if(fifo_full)
			      	 			NS=FIFO_FULL_STATE;
			    			else
			         			NS=DECODE_ADDRESS;

			   			 end

       LOAD_PARITY     	  :	NS=CHECK_PARITY_ERROR;
			 

       FIFO_FULL_STATE	  :	   
          				begin
                        	if(!fifo_full)
			         			NS=LOAD_AFTER_FULL;
			      			else if(fifo_full)
			         			NS=FIFO_FULL_STATE;
			  		 		end
        
        LOAD_AFTER_FULL:	   
          				begin
          					if((!parity_done) && (!low_packet_valid))
			   					NS=LOAD_DATA;
          					else if((!parity_done) && (low_packet_valid))
			   					NS=LOAD_PARITY;
          					else if(parity_done)
			   					NS=DECODE_ADDRESS;
			   			 end
        
      endcase
   end
  
  assign detect_add = ((PS==DECODE_ADDRESS)?1:0); 
  assign write_enb_reg=((PS==LOAD_DATA||PS==LOAD_PARITY||PS==LOAD_AFTER_FULL)?1:0);
  assign full_state=((PS==FIFO_FULL_STATE)?1:0);
  assign lfd_state=((PS==LOAD_FIRST_DATA)?1:0);
  assign busy=((PS==FIFO_FULL_STATE||PS==LOAD_AFTER_FULL||PS==WAIT_TILL_EMPTY||PS==LOAD_FIRST_DATA||PS==LOAD_PARITY||PS==CHECK_PARITY_ERROR)?1:0);
  //assign busy=((PS==LOAD_DATA || PS==DECODE_ADDRESS)?0:1);
  assign ld_state=((PS==LOAD_DATA)?1:0);
  assign laf_state=((PS==LOAD_AFTER_FULL)?1:0);
  assign rst_int_reg=((PS==CHECK_PARITY_ERROR)?1:0);
  
endmodule
  
