reg  dumping;

initial
  dumping = 0;
  
task test_pass;
    begin
      $display ("%t: --- TEST PASSED ---", $time);
      #100;
      $finish;
    end
endtask // test_pass

task test_fail;
    begin
      $display ("%t: !!! TEST FAILED !!!", $time);
      #100;
      $finish;
    end
endtask // test_fail

task dumpon;
    begin
      if (!dumping)
	begin
	  $dumpfile (`DUMPFILE_NAME);
	  $dumpvars;
	  dumping = 1;
	end
    end
endtask // dumpon

task dumpoff;
    begin
      // ???
    end
endtask // dumpoff

task clear_ram;
    integer i;
    begin
      for (i=0; i<32768; i=i+1)
        tb_top.ram.mem[i] = 0;
    end
endtask

