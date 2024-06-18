// This program was cloned from: https://github.com/leeja-j/router_tinytapeout
// License: Apache License 2.0



module router_reg(clock,resetn,pkt_valid,data_in,fifo_full,detect_add,
                  ld_state,laf_state,full_state,lfd_state,rst_int_reg,err,
                  parity_done,low_packet_valid,dout);

input clock,resetn,pkt_valid,fifo_full,detect_add,ld_state,laf_state,full_state,lfd_state,rst_int_reg;
input [2:0]data_in;
output reg err,parity_done,low_packet_valid;
output reg [2:0]dout;
reg [2:0]header,int_reg,int_parity,ext_parity;
  
  
  //------------------------------DATA OUT LOGIC---------------------------------

	always@(posedge clock)
   	begin
      if(!resetn)
      	begin
	     dout    	 <=0;
	     header  	 <=0;
	     int_reg 	 <=0;
       	end
      else if(detect_add && pkt_valid && data_in[1:0]!=2'b11)
	     header<=data_in;
      else if(lfd_state)
	     dout<=header;
      else if(ld_state && !fifo_full)
	     dout<=data_in;
      else if(ld_state && fifo_full)
	     int_reg<=data_in;
      else if(laf_state)
	     dout<=int_reg;
     end

  //---------------------------LOW PACKET VALID LOGIC----------------------------
	
      	always@(posedge clock)
	   		begin
              if(!resetn)
	 				low_packet_valid<=0; 
         		else if(rst_int_reg)
	 				low_packet_valid<=0;

              else if(ld_state && !pkt_valid) 
         			low_packet_valid<=1;
			end
  //----------------------------PARITY DONE LOGIC--------------------------------
	
	always@(posedge clock)
	begin
      if(!resetn)
	  parity_done<=0;
     else if(detect_add)
	  parity_done<=0;
      else if((ld_state && !fifo_full && !pkt_valid)
              ||(laf_state && low_packet_valid && !parity_done))
	  parity_done<=1;
	end

//---------------------------PARITY CALCULATE LOGIC----------------------------

	always@(posedge clock)
	begin
      if(!resetn)
	 int_parity<=0;
	else if(detect_add)
	 int_parity<=0;
	else if(lfd_state && pkt_valid)
	 int_parity<=int_parity^header;
	else if(ld_state && pkt_valid && !full_state)
	 int_parity<=int_parity^data_in;
	else
	 int_parity<=int_parity;
	end
	 

//-------------------------------ERROR LOGIC-----------------------------------

	always@(posedge clock)
		begin
          if(!resetn)
	  			err<=0;
	      else if(parity_done)
	       		begin
	 				if (int_parity==ext_parity)
	    				err<=0;
	 				else 
	    			err<=1;
	 			end
	 	   else
	    		err<=0;
	      end

//-------------------------------EXTERNAL PARITY LOGIC-------------------------

	always@(posedge clock)
	begin
      if(!resetn)
	  		ext_parity<=0;
      else if(detect_add)
	  		ext_parity<=0;
      else if((ld_state && !fifo_full && !pkt_valid) || (laf_state && !parity_done && low_packet_valid))
	  		ext_parity<=data_in;
	 end

endmodule
