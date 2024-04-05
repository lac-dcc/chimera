`ifndef WB_SVTB_ENV__SV
 `define WB_SVTB_ENV__SV


class environment;

   // Generator and Driver and monitors
   wb_svtb_generator gen;
   wb_svtb_master m_driv;
   wb_svtb_slave s_driv;
   wb_svtb_master_mon m_mon;
   wb_svtb_slave_mon s_mon;

   // Scoreboard
   wb_svtb_scoreboard scoreboard;

   // mailboxes for communication
   mailbox gen2driv;
   mailbox mast_mon_mbox;
   mailbox slave_mon_mbox;
   mailbox gen2driv;

   // Interfaces
   virtual intf master_vif;
   virtual intf slave_vif;

   // Constructor
   function new(virtual wb_master_if mvif,wb_slave_if slvif);
      master_vif = mvif;
      slave_vif = slvif;
      // Create mailboxes 
      gen2driv = new();
      mast_mon_mbox = new();
      slave_mon_mbox = new();

      // Create components
      gen = new(gen2driv);
      m_driv = new(mvif,gen2driv);
      s_driv = new(slvif);
      
      scoreboard = new(mast_mon_mbox,slave_mon_mbox);


   endfunction

   // reset 
   task pre_test();
      driv.reset();
   endtask

   The test loop
   task run();
      fork
	 gen.run();
	 m_driv.run();
	 s_driv.run();
	 m_mon.run();
	 s_mon.run
	 scoreboard.run();
      join_any;
   endtask

`endif
