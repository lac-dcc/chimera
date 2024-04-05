task check_main;
	reg     [31:0] tmp;
	reg     [31:0] tmp2;
		  wb_master.wr(32'h0000ffff, 0xdeadbeef, 4'b1111);
		  tmp2 <= {~tmp[31:16],tmp[15:0]); 	
		  if(tmp2 != 0xdeadbeef) 
			 $write("error in Data");
endtask 
