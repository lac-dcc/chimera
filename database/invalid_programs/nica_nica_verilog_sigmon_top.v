// This program was cloned from: https://github.com/acsl-technion/nica
// License: BSD 2-Clause "Simplified" License

//////////////////////////////////////////////////////////////////////////////////////////////////
//
// Signals monitoring: Events tracking & time_stamping a set of preselected events 
// Gabi Malka, Technion, TCE
// June-2017
//
// An event is a combination signal/signals_logic/function, assictated with its time of occurrence
// All tracked events are stored into a dedicated buffer (fifo), to be later read via AXI-Lite 
//
// A free running clock counter is used to time stamp a desired event.
// The counter will be cleared and then start counting once signal monitoring has been enabled.
//
// Up to 128 different events are supported. Each event is associated with its eventID. See the complete localparam list and its eventID's.
// To select a certain event for sampling, use its eventID as the event selector (see events selection in control registers below).
//
// 12 event_counter modules are implemented, for more specific events generation.
// An event counter can be configured to count the occurrences of a specific event, within a specific counting window, then raise a count_event once the counter has reached a preprogrammed count limit.   
// To configure an event_counter, there are three inputs to define:
// 1. count_enable - this input will assert the internal count enable, from which the counter will start counting.
// 2. count_event - this input is the event to be counted. Whenever it is high (and the count_enable is high) the counter is counting.
// 3. count_limit - Tells the event_counter to raise a flag once its count reached the limit
// See the events list below for the specific events originated in the event_counters
//
//
// To facilitate concurrent sampling of multiple signals/events, which may occur at the same time, there are 8 sampling blocks.
// All 8 sampling blocks work independently. 
// Each sampling block can sample up to two different events. A sampled event is stored into a local fifo (1K x 32b)
// Each sampled event is selectable from the set of events mentioned above
// Note: When selecting two events to the same sampler, select two events which are time-orthogonal, such that won't occur at the same time
//
// Time stamping: Once a preselected event has been encountered, it is written to the local fifo, associated with its time stamp.
// A sample event entry, added to local fifo (1 event oer each fifo entry):
// 31...24 23.................0
// <eventID> <timestamp_counter[23:0]>
//
// The 8 local fifos are then read and stored into a common, larger fifo, called sigmon_fifo. 
// Two sigmon fifo sizes are supported (in case of FPGA resoures problem): 128K x 32b and 64K x 32b,  selected by the verilog FIFO_128K parameter (see inside sigmon_top module).
// The default implemented fifo size is 128K x 32b.
//
// A dedicated state_machine constantly scans the 8 local fifos, and transfers the local fifos contents to the sigmon_fifo.
// To optimize the local fifos preemption (to minimize the chance of local fifos full and samples loss), the SM will scan & visit only the non empty fifos. 
//
// Finally, at the end of the signal monitoring session, the host may read the accumulated samples in sigmon_fifo via AXI-Lite .
//
//
// Verilog modification:
// All the signal monitoring logic is implemented in a single verilog module, named sigmon_top.
// sigmon_top is then instanciated inside the nica top level wrapper, ku060_all_exp_hls_wrapper.v
// The axi-lite crossbar inside the top level wrapper was also enhanced, to support the 'new' axi-lite slave
//
// sigmon_top axi-lite interface is attached to the nica wrapper, just like any other ikernel.
// sigmon_top axi-lite address space: h8000..h8fff.
// Inside sigmon_top, only the lease 13 axi-lite address bits are decoded.
//
// Non implemented addresses within the sigmon_top axi-lite address space will behave similarly as with other ikernels:

// Reading from a non existent register will return hdeadf00d as the read data.
// Writing a non existent register will write to sink.
// 
//
//
//========================================================================================================
// Confoguration registers:
//
// A set of contrl registers, written via AXI-Lite, controls the various aspects of signals monitoring:
// Control registers definition:
//
// sigmon_ctrl1:  signal_monitoring_enable, trigger definition
// AXI-Lite address: 'h8000
//    sigmon_ctrl1[11:0]   - Trigger position along the sampling window depth (sliding sampling window) 
//                           Resolution: 32 fifo entries
//                           To position the trigger 32 entries from fifo start, set sigmon_ctrl1[11:0] = 1
//                           Supported values: 0..128k.
//                           Default trigger position = 0: Sampling window begins after trigger occurrence
//    sigmon_ctrl1[15:12]  - Reserved  
//    sigmon_ctrl1[23:16]  - Trigger source. Select either of the input events/sampled signals
//                           Default: 0xff, selecting SIGMON_ENABLED event (start monitoring immediately after enabling sigmon)
//    sigmon_ctrl1[30:24]  - Reserved  
//    sigmon_ctrl1[31]     - sigmon enable. Enables signals monitoring
//                           Upon assertion, the sigmon_fifo and free running counter are cleared.
//                           Note: Following a signal monitoring session, the sigmon fifo must be read before reasserting sigmon_ctrl[31], or otherwise, its contents will be lost 
//
// sigmon_ctrl2:   Selecting which signals will be monitored by event_mon0 & event_mon1 & event_mon2:
// AXI-Lite address: 'h8010
//    sigmon_ctrl2[7:0]    - event_mon0/event1 input.  Default setting: tbd
//    sigmon_ctrl2[15:8]   - event_mon0/event2 input.  Default setting: tbd
//    sigmon_ctrl2[23:16]  - event_mon1/event1 input.  Default setting: tbd
//    sigmon_ctrl2[31:24]  - event_mon1/event2 input.  Default setting: tbd.
//
// sigmon_ctrl3:
// AXI-Lite address: 'h8014
//    sigmon_ctrl3[7:0]    - event_mon2/event1 input.  Default setting: tbd
//    sigmon_ctrl3[15:8]   - event_mon2/event2 input.  Default setting: tbd
//    sigmon_ctrl3[23:16]  - event_mon3/event1 input.  Default setting: tbd
//    sigmon_ctrl3[31:24]  - event_mon3/event2 input.  Default setting: tbd.
//
// sigmon_ctrl4:
// AXI-Lite address: 'h8018
//    sigmon_ctrl4[7:0]    - event_mon4/event1 input.  Default setting: tbd
//    sigmon_ctrl4[15:8]   - event_mon4/event2 input.  Default setting: tbd
//    sigmon_ctrl4[23:16]  - event_mon5/event1 input.  Default setting: tbd
//    sigmon_ctrl4[31:24]  - event_mon5/event2 input.  Default setting: tbd.
//
// sigmon_ctrl5:
// AXI-Lite address: 'h801c
//    sigmon_ctrl5[7:0]    - event_mon6/event1 input.  Default setting: tbd
//    sigmon_ctrl5[15:8]   - event_mon6/event2 input.  Default setting: tbd
//    sigmon_ctrl5[23:16]  - event_mon7/event1 input.  Default setting: tbd
//    sigmon_ctrl5[31:24]  - event_mon7/event2 input.  Default setting: tbd.
//
// sigmon_ctrl9:
// AXI-Lite address: 'h8020
//    sigmon_ctrl9[7:0]    - event monitors (0 thru 7) enable selector.  Default setting: tbd
//    sigmon_ctrl9[15:8]   - Test mode start event selector (for nwp2sbu pushback. see sigmon_top.v)
//    sigmon_ctrl9[23:16]  - Test mode end event selector
//    sigmon_ctrl9[31:24]  - reserved
//
//
// ============================================================================================
// Counters
// ============================================================================================
// Counter0:
// sigmon_ctrl100:
// AXI-Lite address: 'h8100 
//    sigmon_ctrl100[7:0]     - Counter enable event
//    sigmon_ctrl100[15:8]    - Counter disable event
//    sigmon_ctrl100[23:16]   - Counted event
//    sigmon_ctrl100[31:24]   - Counter Mode (see below)
//
// sigmon_ctrl104:
// AXI-Lite address: 'h8104
//    sigmon_ctrl104[31:0]    - Count limit
//
//  Counter Mode                          Description
//  ==========                          ===========
//  SINGLE_EVENT_COUNT_NOLIMIT = 8'h00  Count num of event_in occurrences,
//  SINGLE_EVENT_COUNT_LIMIT = 8'h01    Count num of event_in occurrences. Assert count_event if count > LIMIT
//  REPEAT_COUNT_LIMIT = 8'h02          Count num of event_in occurrences. Assert count_event if count > LIMIT and repeat counting
//  DUAL_EVENTS_COUNT_LIMIT = 8'h03     Count num of both event_in & clear_in occurrences. Assert count_event if count > LIMIT
//  WINDOW_COUNT_LIMIT = 8'h04          Count num of event_in between enable_in and clear_in. Assert count_event if count > LIMIT
//  DUAL_EVENTS_LATENCY = 8'h05         Count num of event_in occurrences, and clear counter upon clear_in. Assert count_event if count > LIMIT
//  DUAL_EVENTS_BALANCE = 8'h06         Separately count num of event_in & clear_in occurrences in counter1 & counter2, respectively.
//                                      Assert count_event if counter2>counter1 or counter1-counter2 > LIMIT
//
// sigmon_ctrl110 & sigmon_ctrl114 .. sigmon_ctrl1b0 & sigmon_ctrl1b4:
//    Counters 1..11 events selection and count limit (correspondingly to counter0)   
//
//
// ============================================================================================
// CLBs/Signals tracking control registers
// ============================================================================================
// sigmon_ctrl10:
// AXI-Lite address: 'h8030
//    sigmon_ctrl10[7:0]    - CLB0_in[0] signal selector. Default setting: tbd
//    sigmon_ctrl10[15:8]   - CLB0_in[1] signal selector. Default setting: tbd
//    sigmon_ctrl10[23:16]  - CLB0_in[2] signal selector. Default setting: tbd
//    sigmon_ctrl10[31:24]  - CLB0_in[3] signal selector. Default setting: tbd.
//
// sigmon_ctrl11:
// AXI-Lite address: 'h8034
//    sigmon_ctrl11[31:0]    - CLB0 start interval limit. Default setting: tbd
//
// sigmon_ctrl12:
// AXI-Lite address: 'h8038
//    sigmon_ctrl12[31:0]    - CLB0 mid interval limit. Default setting: tbd
//
// sigmon_ctrl13:
// AXI-Lite address: 'h8040
//    sigmon_ctrl13[7:0]    - CLB1_in[0] signal selector. Default setting: tbd
//    sigmon_ctrl13[15:8]   - CLB1_in[1] signal selector. Default setting: tbd
//    sigmon_ctrl13[23:16]  - CLB1_in[2] signal selector. Default setting: tbd
//    sigmon_ctrl13[31:24]  - CLB1_in[3] signal selector. Default setting: tbd.
//
// sigmon_ctrl14:
// AXI-Lite address: 'h8044
//    sigmon_ctrl14[31:0]   - CLB1 start interval limit. Default setting: tbd
//
// sigmon_ctrl15:
// AXI-Lite address: 'h8048
//    sigmon_ctrl15[31:0]   - CLB1 mid interval limit. Default setting: tbd
//
// sigmon_ctrl16:
// AXI-Lite address: 'h8050
//    sigmon_ctrl16[7:0]    - CLB2_in[0] signal selector. Default setting: tbd
//    sigmon_ctrl16[15:8]   - CLB2_in[1] signal selector. Default setting: tbd
//    sigmon_ctrl16[23:16]  - CLB2_in[2] signal selector. Default setting: tbd
//    sigmon_ctrl16[31:24]  - CLB2_in[3] signal selector. Default setting: tbd.
//
// sigmon_ctrl17:
// AXI-Lite address: 'h8054
//    sigmon_ctrl17[31:0]   - CLB2 start interval limit. Default setting: tbd
//
// sigmon_ctrl18:
// AXI-Lite address: 'h8058
//    sigmon_ctrl18[31:0]   - CLB2 mid interval limit. Default setting: tbd
//
// sigmon_ctrl19:
// AXI-Lite address: 'h8060
//    sigmon_ctrl19[7:0]    - CLB2_in[0] signal selector. Default setting: tbd
//    sigmon_ctrl19[15:8]   - CLB2_in[1] signal selector. Default setting: tbd
//    sigmon_ctrl19[23:16]  - CLB2_in[2] signal selector. Default setting: tbd
//    sigmon_ctrl19[31:24]  - CLB2_in[3] signal selector. Default setting: tbd.
//
// sigmon_ctrl20:
// AXI-Lite address: 'h8064
//    sigmon_ctrl20[31:0]   - CLB2 start interval limit. Default setting: tbd
//
// sigmon_ctrl21:
// AXI-Lite address: 'h8068
//    sigmon_ctrl21[31:0]   - CLB2 mid interval limit. Default setting: tbd
//
// sigmon_ctrl22:
// AXI-Lite address: 'h8070
//    sigmon_ctrl22[7:0]    - CLB0 logic equation (see sigmon_logic_block.v for details). Default setting: tbd
//    sigmon_ctrl22[15:8]   - CLB1 logic equation (see sigmon_logic_block.v for details). Default setting: tbd
//    sigmon_ctrl22[23:16]  - CLB2 logic equation (see sigmon_logic_block.v for details). Default setting: tbd
//    sigmon_ctrl22[31:24]  - CLB3 logic equation (see sigmon_logic_block.v for details). Default setting: tbd
//
//
// sigmon_clbs_status: CLBs selected signals and output
// AXI-Lite address: 'h802c
//    sigmon_clbs_status[3:0]    - CLB0 selected signals
//    sigmon_clbs_status[6:4]    - Reserved (read as 0)
//    sigmon_clbs_status[7]      - CLB0 out (resulted function out)
//    sigmon_clbs_status[11:8]   - CLB1 selected signals
//    sigmon_clbs_status[14:12]  - Reserved (read as 0)
//    sigmon_clbs_status[15]     - CLB1 out (resulted function out)
//    sigmon_clbs_status[19:16]   - CLB2 selected signals
//    sigmon_clbs_status[22:20]  - Reserved (read as 0)
//    sigmon_clbs_status[23]     - CLB2 out (resulted function out)
//    sigmon_clbs_status[27:24]   - CLB3 selected signals
//    sigmon_clbs_status[30:28]  - Reserved (read as 0)
//    sigmon_clbs_status[31]     - CLB3 out (resulted function out)
//
// 
// Pattern Searching/Sampling. Overview: 
// =====================================
// 1. Searching for a predetermined pattern in an axi4stream. A specific event  is flagged, if found.
// 2. The predetermed pattern is limitted to 6 sequential bytes, starting from a predetermined byte_location along the axi4stream sequence.
// 3. The searched pattern is byte maskable.
// 4. Four pattern units are implemented, individually configured to sample/match either of the 4 streams: nwp2sbu, sbu2nwp, cxp2sbu, sbu2cxp.
// 5. pattern matching & sampling may cross the axistream line boundary.
// 6. Upon sampling a specific sequence in an axi4stream, the sampled value is recorded into a sigmon_event_monitor (consuming 2 fifo lines), 
//    immediately following a regular timestamp record.
// 7. Two or more pattern units may be combined, to match a wider that 6 bytes pattern.
//    All four pattern units may be combined, to yild a single combined event (i.e: to search for a 24 byte long pattern).
// 8. The following events are defined (see sigmon_events.v for a detailed *_PATTERN_* list of events):
//    STREAMx_PATTERN_MATCH  - The searched pattern has been met (x designates either of the four selectable streams).
//    STREAMx_PATTERN_SAMPLE - The requested sample has been encountered.
//    STREAMx_PATTERN_MERGED - The combined pattern events has been met
//
//                           
// sigmon_stream0_pattern_ctrl1: 'h8050 
//    sigmon_stream0_pattern_ctrl1[31]      - Mode: 0: Pattern matching, 1: Pattern Sampling
//    sigmon_stream0_pattern_ctrl1[30:28]   - reserved
//    sigmon_stream0_pattern_ctrl1[27:24]   - stream select
//    sigmon_stream0_pattern_ctrl1[23:20]   - reserved
//    sigmon_stream0_pattern_ctrl1[19:16]   - Merge events from the specified pattern units. Useful to match more than 6 bytes within the same packet
//                                            I.e: sigmon_stream0_pattern_ctrl1[19:16] == 4'b0011: events from pattern units 0 & 1 will be merged,
//                                            Notes: 
//                                            1. Merging events is meaningful only if the pattern units are configured to test/match the same stream,
//                                               and with same enable/disable triggering.
//                                               Notice that the pattern units do not verify this prerequisite !!!!
//                                            2. Events merge is bounded to within the same packet.
//                                              
//    sigmon_stream0_pattern_ctrl1[15:8]    - Match_Mask, bit per each pattern_byte: 1: byte masked. 0: byte compared
//    sigmon_stream0_pattern_ctrl1[7:0]     - Pattern byte address (within first 256 bytes of the stream)
//
// sigmon_stream0_pattern_ctrl2: 'h8054 
//    sigmon_stream0_pattern_ctrl2[31:16]   - reserved
//    sigmon_stream0_pattern_ctrl2[15:8]    - stream pattern matching disable (select either of other events) 
//    sigmon_stream0_pattern_ctrl2[7:0]     - stream pattern matching enable (select either of other events)
//
// sigmon_stream0_pattern_h: 'h8058 
//    sigmon_stream0_pattern_h[31:16]      - reserved
//    sigmon_stream0_pattern_h[15:0]       - Pattern[47:32] 
//
// sigmon_stream0_pattern_l: 'h805c 
//    sigmon_stream0_pattern_l[31:0]       - Pattern[31:0]
//
// More streams (same register mappping as in stream0):
// sigmon_stream1_pattern_ctrl1: 'h8060 
// sigmon_stream1_pattern_ctrl2: 'h8064 
// sigmon_stream1_pattern_h: 'h8068 
// sigmon_stream1_pattern_l: 'h806c 
// sigmon_stream2_pattern_ctrl1: 'h8070 
// sigmon_stream2_pattern_ctrl2: 'h8074 
// sigmon_stream2_pattern_h: 'h8078 
// sigmon_stream2_pattern_l: 'h807c 
// sigmon_stream3_pattern_ctrl1: 'h8080 
// sigmon_stream3_pattern_ctrl2: 'h8084 
// sigmon_stream3_pattern_h: 'h8088 
// sigmon_stream3_pattern_l: 'h808c 
//                                 
//                               
// sigmon_status[31:0]:
// AXI-Lite address: 'h8004
//    sigmon_status[17:0]  - sigmon_fifo data count
//    sigmon_status[19:18] - reserved, read as zeros
//    sigmon_status[20]    - sigmon_fifo output valid, indicating non empty fifo
//    sigmon_status[21]    - the preprogrammed trigger has occurred
//    sigmon_status[23:22] - CLBs 0 & 1 logic output
//    sigmon_status[31:24] - Latest events samples have lost, due to events fifos full.
//                           This indication means that latest samples of some event were lost due to sigmon_fifo & event_fifo are both full.
//                           Notice that in such cases the sigmon_fifo & event_fifos contents are still valid. It means that the implemented fifos depth is not deep enough.
//                           Yet, to capture those lost samples, you may:
//                           1. delay the trigger source (sigmon_ctrl1[23:16]) by selecting another/later event.
//                              If you can't select a later event, you can still delay the existing trigger source by a specific time delay,
//                              by using either of the event_counters. See the Sample Monitoring Session below, to learn how to.
//                           2. move the trigger position towards the bottom (exit) of the sigmon_fifo (lower values at sigmon_ctrl1[11:0])
//                           3. If the samples loss happened with the 64Kx32b sigmon_fifo, consider rebuilding the image with the 128Kx32b fifo.
//                              for how to, look for the FIFO_128K knob.
//
//
// Implemented monitored signals/events (see $NICA_AREA/sources/vlog/sigmon_events.v for latest/updated events and its associated codes):
//
// End of a valid packet: tlast & valid & ready at either of the axi-stream interfaces
// eventID               Description/logic functioin
// ===================   ==================================================================
// SBU2CXPFIFO_EOP       sbu2cxpfifo_tlast & sbu2cxpfifo_vld & sbu2cxpfifo_rdy
// SBU2CXP_EOP           sbu2cxp_tlast & sbu2cxp_vld & sbu2cxp_rdy
// CXP2SBU_EOP           cxp2sbu_tlast & cxp2sbu_vld & cxp2sbu_rdy
// SBU2NWPFIFO_EOP       sbu2nwpfifo_tlast & sbu2nwpfifo_vld & sbu2nwpfifo_rdy
// SBU2NWP_EOP           sbu2nwp_tlast & sbu2nwp_vld & sbu2nwp_rdy
// NWP2SBU_EOP           nwp2sbu_tlast & nwp2sbu_vld & nwp2sbu_rdy
//
//
// Start of a valid packet: valid & ready following tlast_dropped:
// eventID               Description/logic functioin
// ===================   ==================================================================
// SBU2CXPFIFO_SOP       sbu2cxpfifo_sop & sbu2cxpfifo_vld & sbu2cxpfifo_rdy
// SBU2CXP_SOP           sbu2cxp_sop & sbu2cxp_vld & sbu2cxp_rdy
// CXP2SBU_SOP           cxp2sbu_sop & cxp2sbu_vld & cxp2sbu_rdy
// SBU2NWPFIFO_SOP       sbu2nwpfifo_sop & sbu2nwpfifo_vld & sbu2nwpfifo_rdy
// SBU2NWP_SOP           sbu2nwp_sop & sbu2nwp_vld & sbu2nwp_rdy
// NWP2SBU_SOP           nwp2sbu_sop & nwp2sbu_vld & nwp2sbu_rdy
//
//
// lossless credits assertion & deassertion on both nwp2sbu and cxp2sbu interfaces 
// eventID               Description/logic functioin
// ===================   ==================================================================
// NWP2SBU_LOSSLESS_CREDITS_ON    nwp2sbu_credits_asserted
// NWP2SBU_LOSSLESS_CREDITS_OFF   nwp2sbu_credits_deasserted
// CXP2SBU_LOSSLESS_CREDITS_ON    cxp2sbu_credits_asserted
// CXP2SBU_LOSSLESS_CREDITS_OFF   cxp2sbu_credits_deasserted
//
//
// Signals between nica and ikernels: A place holder for 8 signals/events. 
// sigmon_top module already implements 16 dedicated inputs: nica_events[15:0]
// Currently, those inputs are wired to 8'h00 (see under ku060_all_exp_hls_wrapper.v).
// Once available in nica, use nica_events[15:0] to wire the desired event/events from nica to sigmon_top
// nica events are associated with the following eventIDs. Use these IDs to choose a specific nica event for further sampling/monitoring:
// eventID               Description/logic function
// ===================   ==================================================================
// NICA_EVENT0          nica event[0] (tbd)
// NICA_EVENT15..1      nica event[15:1] (tbd)
//
//
// The event_counter modules generate the following events, Use these IDs to choose a specific counter event for further sampling/monitoring:
// eventID               Description/logic functioin
// =======               ==================================================================
// LOCAL_EVENT0          event_count0 has reached its count limit
// LOCAL_EVENT11..1      event_counter 11..1 has reached its count limit
//
//
// Some more useful events:
// eventID               Description/logic functioin
// =======               ==================================================================
// NO_EVENT              No event, in case you want to tie a certain event input to 'false'
// EVENT_TRUE            Always_on event, in case you want to tie a certain event input to 'true'. See Sample Sesion below for a usage example
// TIMESTAMP_24TOGGLE    An generated event, once the timestamp counter crosses 2^24. 
//                       Since the timestamp recording into sigmon_fifo is limtted to 24 ls bits only, use this event  to track timestamp values > 2^24
// ENT_FALSE             Same as NO_EVENT
// SIGMON_ENABLED        The signal monitoring has been enabled. Useful to assert the trigger right from the start
//
//
//
//========================================================================================= 
// A typical monitoring session steps
//
// Configuring sigmon_top to invoke signals monitoring (see configuration registers definition below):
// 1. Configure the event samplers inputs with the desired events/signals to be sampled
// 2. If required, configure the event_counters, to generate a more specific event 
// 3. Determine the trigger source, as either of the event sources
// 4. Determine the trigger position along the sigmon_fifo depth
// 5. Enable signal monitoring
// 6. Potentially, poll sigmon_status, to verify the trigger was fired 
//    Or just wait for a while and read sigmon_status
// 7. Extract sigmon_fifo contents (by reading sigmon_status.number_of_entries (or less) from sigmon_fifo
// 8. If a finer sampling is required, adjust the trigger, and/or modify the sampled events and rerun
//
//
//========================================================================================= 
// Sample Monitoring test_bench Session:
//
////    Cascading event_count0 and event_count1 to generate a timed trigger.
////    Capturing the events NWP2SBU_SOP, NWP2SBU_EOP and CXP2SBU_CREDITS_OFF, once the trigger occurred.
//
//// This session assumes the default test bench stimulus files.
//// Append the following lines to ~/<netperf-workarea>/tb/exp_vlog/prj.sim/sim_1/behav/mlx_lite_file.txt
//
//
//// Writing to sigmon_ctrl2:
//// Configure event monitor #0 to capture both NWP2SBU_SOP (h0c) and NWP2SBU_EOP (h0d)
//// event monitor #1 is disabled.
// 1000: 0 8010 00000d0c
//
//// Writing to sigmon_ctrl3:
//// Configure event monitor #2 to capture CXP2SBU_CREDITS_OFF (x21)
//// event monitor #3 is disabled.
// 10: 0 8014 00000021
//
//// sigmon_ctrl4 & sigmon_ctrl5 are cleared, to disable event monitors #4 thru #7.
// 10: 0 8018 00000000
// 10: 0 801c 00000000
//
//// sigmon_ctrl6: Configuring both event_count0 and event_count1.
//
//// Configuring event_counter0 to count h200 clocks from signals monitoring enabled (asserting sigmon_ctrl1[31]):
//// The count_enable input is selected as SIGMON_ENABLED (xff), to turn on the counter enable right from the start.
//// The count_event input is set to constant 'high' (EVENT_TRUE, x01).
//// Once this counter hits its limit, is asserts the event LOCAL_EVENT0 (used below to enable event_count1)
//
//// Configuring event_count1 to count h64 assertions of CXP2SBU_CREDITS, from the moment the previous counter (event_count0) has reached its limit:
//// The count_enable input is selected as the event_count0 output (LOCAL_EVENT0, x2c).
//// The count_event input is set to CXP2SBU_CREDITS_ON (x20)
//// Once this counter hits its limit, is asserts the event LOCAL_EVENT1 (used below to generate the trigger)
// 10: 0 8020 202c013f
//
//// Writing to sigmon_ctrl7:
//// Setting the event_count0 count limit to h200:
// 10: 0 8024 00000200
//
//
//// Writing to sigmon_ctrl8:
//// Setting the event_count1 count limit to h64:
// 10: 0 8028 00000064
//
//
//// Start monitoring
////=================
//// Configure sigmon_ctrl1 to:
//// trigger position = 2 * 32 entries from start
//// trigger source to 0x2d (LOCAL_EVENT1, output of event_count1)
//// Enable monitoring
// 1000: 0 8000 802d0002
//
//// Read sigmon_status
// 50000: 1 8004
//
//// read one entry from sigmon fifo
// 10: 1 8008
//
//// End of Sample Monitoring Session:
//
//
//
//========================================================================================= 
// Implementation Option: Add a time stamping compression mechanism, to optimize the sigmon fifo utilization
// This scheme is still not implemented.
//
// Rather than adding the full time stamp per each event, as currently implemented, only its difference vs. latter event sample will be written to the fifo.
// This scheme will be useful in a densed events scenario, in which the time-delta between the events is small, thus allowing more events to be captured by the fifo.
//
// Compressed time-stamed event format:
// 31...26 25............24 23.........16 15..........8 7...........0
// <event> <time_stamp_len> <time stamp1> <time stamp2> <time stamp3>
//
// For example, lets see how the following captured events will be written into the fifo:
//
// event1 @ t1 - the first event to be recorded
// event2 @ t1 - occurred at the same time as event1.
// event3 @ t2 - assuming t2-t1 < 2^8 (can be held within a byte)
// event4 @ t3 - assuming t3-t2 < 2^8 (can be held within a byte)
// event5 @ t4 - assuming t4-t3 < 2^16 (can be held within two bytes)
//
// fifo contents:
// entry #1: 31....26 25.24 23.......16 15.......8 7.......0
//           <event1> <  3> <t1[23:16]> <t1[15:8]> <t1[7:0]>  
//
// entry #2: 31....26 25.24 23....18 17.16 15...........8 7......2 1..0
//           <event2> <  0> <event3> <  1> <(t2-t1)[7:0]> <event4> < 1>
// 
// entry #3: 31..........24 23....18 17.16 15............8 7............0
//           <(t3-t2)[7:0]> <event5> <  2> <(t4-t3)[15:8]> <(t4-t3)[7:0]> 
//  
// Bottom line: In the anove example, only 3 fifo entries are used to hold 5 events.
//
// Compression formatting issues:
// Event identifier is limitted to 6 bits
// time_stamp_len is limitted to 2 bits: Max time_stamp is three bytes
//
//
// Another compression alternative: Use a running-length bit in time_stamp:
// For example, lets see how the following captured events will be written into the fifo:
// Note: A full time stamp occupies 3 bytes ([23:0])
//
// event1 @ t1 - the first event to be recorded.
// event2 @ t1 - occurred at the same time as event1.
// event3 @ t2 - assuming t2-t1 < 2^7
// event4 @ t3 - assuming t3-t2 < 2^7
// event5 @ t4 - assuming t4-t3 < 2^14
//
// fifo contents:
// entry #1: 31....24 23.22.......16 15.14........8  7.6........0
//           <event1> <1><t1[23:21]> <1><t1[20:14]> <1><t1[13:7]>
//           Since there is no prev. event, a full timestamp is recorded
//
// entry #2: 31.30.....24 23....16 15.14..8  7.....0
//           <0><t1[6:0]> <event2> <0><  0> <event3>
//
// entry #3: 31  30..........24 23....16 15  14...........8 7......0
//           <0> <(t2-t1)[6:0]> <event4> <0> <(t3-t2)[6:0]> <event5>
//
// entry #4: 30.30...........24 23.22..........16 15......0
//           <1><(t4-t3)[13:7]> <0><(t4-t3)[6:0]>
//
// 
//
module sigmon_top #(
parameter
    AXILITE_ADDR_WIDTH = 13,
    AXILITE_DATA_WIDTH = 32
)(
    input wire 				  clk,
    input wire 				  reset,

    // AXI_lites interface
    input wire [AXILITE_ADDR_WIDTH-1:0]   axi_AWADDR,
    input wire 				  axi_AWVALID,
    output wire 			  axi_AWREADY,
    input wire [AXILITE_DATA_WIDTH-1:0]   axi_WDATA,
    input wire [AXILITE_DATA_WIDTH/8-1:0] axi_WSTRB, // Not used by this AXILites slave. Assumed always all-1
    input wire 				  axi_WVALID,
    output wire 			  axi_WREADY,
    output wire [1:0] 			  axi_BRESP,
    output wire 			  axi_BVALID,
    input wire 				  axi_BREADY,
    input wire [AXILITE_ADDR_WIDTH-1:0]   axi_ARADDR,
    input wire 				  axi_ARVALID,
    output wire 			  axi_ARREADY,
    output wire [AXILITE_DATA_WIDTH-1:0]  axi_RDATA,
    output wire [1:0] 			  axi_RRESP,
    output wire 			  axi_RVALID,
    input wire 				  axi_RREADY,

  // test_mode output to top wrapper:
    output wire 			  test_mode,

    // monitored signals
    input 				  nwp2sbu_rdy_in,
    input 				  nwp2sbu_rdy_temp_in,
    input 				  nwp2sbu_vld_in,
    input 				  nwp2sbu_tlast_in,
    input [255:0] 			  nwp2sbu_data_in,
    input 				  sbu2nwp_rdy_in,
    input 				  sbu2nwp_vld_in,
    input 				  sbu2nwp_tlast_in,
    input [255:0] 			  sbu2nwp_data_in,
    input 				  cxp2sbu_rdy_in,
    input 				  cxp2sbu_vld_in,
    input 				  cxp2sbu_tlast_in,
    input [255:0] 			  cxp2sbu_data_in,
    input 				  sbu2cxp_rdy_in,
    input 				  sbu2cxp_vld_in,
    input 				  sbu2cxp_tlast_in,
    input [255:0] 			  sbu2cxp_data_in,
    input 				  sbu2cxpfifo_vld_in,
    input 				  sbu2cxpfifo_rdy_in,
    input 				  sbu2cxpfifo_tlast_in,
    input 				  sbu2nwpfifo_vld_in,
    input 				  sbu2nwpfifo_rdy_in,
    input 				  sbu2nwpfifo_tlast_in,
    input 				  nwp2sbu_lossless_credits_in,
    input 				  cxp2sbu_lossless_credits_in,
    input 				  ik2map_axi4mm_aw_rdy_in,
    input 				  ik2map_axi4mm_aw_vld_in,
    input 				  axi4mm_aw_rdy_in,
    input 				  axi4mm_aw_vld_in,
    input 				  axi4mm_w_rdy_in,
    input 				  axi4mm_w_vld_in,
    input 				  axi4mm_w_last_in,
    input 				  axi4mm_b_rdy_in,
    input 				  axi4mm_b_vld_in,
    input 				  ik2map_axi4mm_ar_rdy_in,
    input 				  ik2map_axi4mm_ar_vld_in,
    input 				  axi4mm_ar_rdy_in,
    input 				  axi4mm_ar_vld_in,
    input 				  axi4mm_r_rdy_in,
    input 				  axi4mm_r_vld_in,
    input 				  axi4mm_r_last_in,
    input [63:0] 			  ik2map_axi4mm_aw_addr_in,
    input [63:0] 			  ik2map_axi4mm_ar_addr_in,
    input [31:0] 			  sbu2mlx_axi4mm_aw_addr_in,
    input [31:0] 			  sbu2mlx_axi4mm_ar_addr_in,

    input [15:0] 			  nica_events_in,

  // Misc signals
    input [31:0] 			  dram_ctrl_in
  
  );

// sigmon fifo size selection: 128Kx32b or 64Kx32b
// Default selection: 128Kx32b
// To select the 64Kx32b fifo, just comment out this line...
`define FIFO_128K 1
  
localparam
    WRIDLE                     = 2'd0,
    WRDATA                     = 2'd1,
    WRRESP                     = 2'd2,
    RDIDLE                     = 2'd0,
    RDDATA                     = 2'd1;

//AXI-lite address mapping of internal sigmon registers 
localparam

//Control, status , monitors fifo data out:
  ADDR_SIGMON_CTRL1        = 13'h1000, // write only
  ADDR_SIGMON_FIFO_STATUS  = 13'h1004, // read only
  ADDR_SIGMON_FIFO_DATA    = 13'h1008, // read only

// Monitors input selection & monitoring enable:
  ADDR_SIGMON_CTRL2        = 13'h1010, // write only
  ADDR_SIGMON_CTRL3        = 13'h1014, // write only
  ADDR_SIGMON_CTRL4        = 13'h1018, // write only
  ADDR_SIGMON_CTRL5        = 13'h101c, // write only
  ADDR_SIGMON_CTRL9        = 13'h1020, // write only

// CLBs/logic signals tracking:
  ADDR_SIGMON_CLBS_STATUS  = 13'h102c, // read only
  ADDR_SIGMON_CTRL10       = 13'h1030, // write only - CLB 0 signals select
  ADDR_SIGMON_CTRL11       = 13'h1034, // write only - CLB 0 start interval limit
  ADDR_SIGMON_CTRL12       = 13'h1038, // write only - CLB 0 mid interval limit
  ADDR_SIGMON_CTRL13       = 13'h1040, // write only - CLB 1 signals select
  ADDR_SIGMON_CTRL14       = 13'h1044, // write only - CLB 1 start interval limit
  ADDR_SIGMON_CTRL15       = 13'h1048, // write only - CLB 1 mid interval limit
  ADDR_SIGMON_CTRL16       = 13'h1050, // write only - CLB 2 signals select
  ADDR_SIGMON_CTRL17       = 13'h1054, // write only - CLB 2 start interval limit
  ADDR_SIGMON_CTRL18       = 13'h1058, // write only - CLB 2 mid interval limit
  ADDR_SIGMON_CTRL19       = 13'h1060, // write only - CLB 3 signals select
  ADDR_SIGMON_CTRL20       = 13'h1064, // write only - CLB 3 start interval limit
  ADDR_SIGMON_CTRL21       = 13'h1068, // write only - CLB 3 mid interval limit
  ADDR_SIGMON_CTRL22       = 13'h1070, // write only - CLBs 0..3 logic function equation

// Event counters:
  ADDR_SIGMON_CTRL100      = 13'h1100, // write only - event counter 0 inputs select
  ADDR_SIGMON_CTRL104      = 13'h1104, // read/write - event counter 0 counter_output/count_limit
  ADDR_SIGMON_CTRL110      = 13'h1110, // write only - event counter 1 inputs select
  ADDR_SIGMON_CTRL114      = 13'h1114, // read/write - event counter 1 counter_output/count_limit
  ADDR_SIGMON_CTRL120      = 13'h1120, // write only - event counter 2 inputs select
  ADDR_SIGMON_CTRL124      = 13'h1124, // read/write - event counter 2 counter_output/count_limit
  ADDR_SIGMON_CTRL130      = 13'h1130, // write only - event counter 3 inputs select
  ADDR_SIGMON_CTRL134      = 13'h1134, // read/write - event counter 3 counter_output/count_limit
  ADDR_SIGMON_CTRL140      = 13'h1140, // write only - event counter 4 inputs select
  ADDR_SIGMON_CTRL144      = 13'h1144, // read/write - event counter 4 counter_output/count_limit
  ADDR_SIGMON_CTRL150      = 13'h1150, // write only - event counter 4 inputs select
  ADDR_SIGMON_CTRL154      = 13'h1154, // read/write - event counter 4 counter_output/count_limit
  ADDR_SIGMON_CTRL160      = 13'h1160, // write only - event counter 4 inputs select
  ADDR_SIGMON_CTRL164      = 13'h1164, // read/write - event counter 4 counter_output/count_limit
  ADDR_SIGMON_CTRL170      = 13'h1170, // write only - event counter 4 inputs select
  ADDR_SIGMON_CTRL174      = 13'h1174, // read/write - event counter 4 counter_output/count_limit
  ADDR_SIGMON_CTRL180      = 13'h1180, // write only - event counter 4 inputs select
  ADDR_SIGMON_CTRL184      = 13'h1184, // read/write - event counter 4 counter_output/count_limit
  ADDR_SIGMON_CTRL190      = 13'h1190, // write only - event counter 4 inputs select
  ADDR_SIGMON_CTRL194      = 13'h1194, // read/write - event counter 4 counter_output/count_limit
  ADDR_SIGMON_CTRL1A0      = 13'h11a0, // write only - event counter 4 inputs select
  ADDR_SIGMON_CTRL1A4      = 13'h11a4, // read/write - event counter 4 counter_output/count_limit
  ADDR_SIGMON_CTRL1B0      = 13'h11b0, // write only - event counter 4 inputs select
  ADDR_SIGMON_CTRL1B4      = 13'h11b4, // read/write - event counter 4 counter_output/count_limit
  
// axi4streams pattern matching:
  ADDR_SIGMON_STREAM0_PATTERN_CTRL1 = 13'h1250, // write only
  ADDR_SIGMON_STREAM0_PATTERN_CTRL2 = 13'h1254, // write only
  ADDR_SIGMON_STREAM0_PATTERN_H     = 13'h1258, // write only
  ADDR_SIGMON_STREAM0_PATTERN_L     = 13'h125C, // write only
  ADDR_SIGMON_STREAM1_PATTERN_CTRL1 = 13'h1260, // write only
  ADDR_SIGMON_STREAM1_PATTERN_CTRL2 = 13'h1264, // write only
  ADDR_SIGMON_STREAM1_PATTERN_H     = 13'h1268, // write only
  ADDR_SIGMON_STREAM1_PATTERN_L     = 13'h126C, // write only
  ADDR_SIGMON_STREAM2_PATTERN_CTRL1 = 13'h1270, // write only
  ADDR_SIGMON_STREAM2_PATTERN_CTRL2 = 13'h1274, // write only
  ADDR_SIGMON_STREAM2_PATTERN_H     = 13'h1278, // write only
  ADDR_SIGMON_STREAM2_PATTERN_L     = 13'h127C, // write only
  ADDR_SIGMON_STREAM3_PATTERN_CTRL1 = 13'h1280, // write only
  ADDR_SIGMON_STREAM3_PATTERN_CTRL2 = 13'h1284, // write only
  ADDR_SIGMON_STREAM3_PATTERN_H     = 13'h1288, // write only
  ADDR_SIGMON_STREAM3_PATTERN_L     = 13'h128C; // write only


`include "sigmon_events.v"


// Sampling all input tracked signals, to minimize timing impact on those signals,
// such that sigmon will track/monitor the sampled version
  reg 					  nwp2sbu_rdy;
  reg 					  nwp2sbu_rdy_temp;
  reg 					  nwp2sbu_vld;
  reg 					  nwp2sbu_tlast;
  reg [255:0]				  nwp2sbu_data;
  reg 					  sbu2nwp_rdy;
  reg 					  sbu2nwp_vld;
  reg 					  sbu2nwp_tlast;
  reg [255:0] 				  sbu2nwp_data;
  reg 					  cxp2sbu_rdy;
  reg 					  cxp2sbu_vld;
  reg 					  cxp2sbu_tlast;
  reg [255:0]				  cxp2sbu_data;
  reg 					  sbu2cxp_rdy;
  reg 					  sbu2cxp_vld;
  reg 					  sbu2cxp_tlast;
  reg [255:0] 				  sbu2cxp_data;
  reg 					  sbu2cxpfifo_vld;
  reg 					  sbu2cxpfifo_rdy;
  reg 					  sbu2cxpfifo_tlast;
  reg 					  sbu2nwpfifo_vld;
  reg 					  sbu2nwpfifo_rdy;
  reg 					  sbu2nwpfifo_tlast;
  reg 					  nwp2sbu_lossless_credits;
  reg 					  cxp2sbu_lossless_credits;
  reg 					  ik2map_axi4mm_aw_rdy;
  reg 					  ik2map_axi4mm_aw_vld;
  reg 					  axi4mm_aw_rdy;
  reg 					  axi4mm_aw_vld;
  reg 					  axi4mm_w_rdy;
  reg 					  axi4mm_w_vld;
  reg 					  axi4mm_w_last;
  reg 					  axi4mm_b_rdy;
  reg 					  axi4mm_b_vld;
  reg 					  ik2map_axi4mm_ar_rdy;
  reg 					  ik2map_axi4mm_ar_vld;
  reg 					  axi4mm_ar_rdy;
  reg 					  axi4mm_ar_vld;
  reg 					  axi4mm_r_rdy;
  reg 					  axi4mm_r_vld;
  reg 					  axi4mm_r_last;
  reg [63:0] 				  ik2map_axi4mm_aw_addr;
  reg [63:0] 				  ik2map_axi4mm_ar_addr;
  reg [31:0] 				  sbu2mlx_axi4mm_aw_addr;
  reg [31:0] 				  sbu2mlx_axi4mm_ar_addr;

  reg [15:0] 				  nica_events;
  reg [31:0] 				  dram_ctrl;
  reg 					  clb0_outQ;
  reg 					  clb0_out_on;
  reg 					  clb0_out_off;
  reg 					  clb1_outQ;
  reg 					  clb1_out_on;
  reg 					  clb1_out_off;
  reg 					  clb2_outQ;
  reg 					  clb2_out_on;
  reg 					  clb2_out_off;
  reg 					  clb3_outQ;
  reg 					  clb3_out_on;
  reg 					  clb3_out_off;
  reg 					  monitoring_enable_asserted;
  reg 					  monitoring_enable_assertedQ;
  reg 					  timestamp_counter_enable;    
  reg [47:0] 				  timestamp_counter;
  reg 					  timestamp_counter_24toggle;
  reg 					  sigmon_fifo_drop;
  reg 					  trigger_occurred;

  // event monitors:
  reg [7:0]   event_fifo_rd;
  wire [7:0]  events_data_loss;
  reg 	      event_fifo_implied_data;
  reg [31:0]  event_fifo_data;
  wire [35:0] event0_fifo_data;
  wire [35:0] event1_fifo_data;
  wire [35:0] event2_fifo_data;
  wire [35:0] event3_fifo_data;
  wire [35:0] event4_fifo_data;
  wire [35:0] event5_fifo_data;
  wire [35:0] event6_fifo_data;
  wire [35:0] event7_fifo_data;
  wire [10:0] event0_fifo_data_count;
  wire [10:0] event1_fifo_data_count;
  wire [10:0] event2_fifo_data_count;
  wire [10:0] event3_fifo_data_count;
  wire [10:0] event4_fifo_data_count;
  wire [10:0] event5_fifo_data_count;
  wire [10:0] event6_fifo_data_count;
  wire [10:0] event7_fifo_data_count;

  reg [2:0]   event_index;      // pointer to the currently served event monitor.
  reg [2:0]   next_event_index;
  wire [7:0]  events_valid;
  wire [15:0] events_valid_dup; // holds two consequtive duplicates of events_valid[7:0]
  reg 	      event_index_p1;
  reg 	      event_index_p2;
  reg 	      event_index_p3;
  reg 	      event_index_p4;
  reg 	      event_index_p5;
  reg 	      event_index_p6;
  reg 	      event_index_p7;
  reg 	      event_index_p8;
  reg	      no_events;
  reg 	      event_valid;
  reg [10:0] event_fifo_data_count; 
  reg [7:0]  event_read;
  

  always @(posedge clk) begin
    nwp2sbu_rdy <= nwp2sbu_rdy_in;
    nwp2sbu_rdy_temp <= nwp2sbu_rdy_temp_in;
    nwp2sbu_vld <= nwp2sbu_vld_in;
    nwp2sbu_tlast <= nwp2sbu_tlast_in;
    nwp2sbu_data <= nwp2sbu_data_in;
    sbu2nwp_rdy <= sbu2nwp_rdy_in;
    sbu2nwp_vld <= sbu2nwp_vld_in;
    sbu2nwp_tlast <= sbu2nwp_tlast_in;
    sbu2nwp_data <= sbu2nwp_data_in;
    cxp2sbu_rdy <= cxp2sbu_rdy_in;
    cxp2sbu_vld <= cxp2sbu_vld_in;
    cxp2sbu_tlast <= cxp2sbu_tlast_in;
    cxp2sbu_data <= cxp2sbu_data_in;
    sbu2cxp_rdy <= sbu2cxp_rdy_in;
    sbu2cxp_vld <= sbu2cxp_vld_in;
    sbu2cxp_tlast <= sbu2cxp_tlast_in;
    sbu2cxp_data <= sbu2cxp_data_in;
    sbu2cxpfifo_vld <= sbu2cxpfifo_vld_in;
    sbu2cxpfifo_rdy <= sbu2cxpfifo_rdy_in;
    sbu2cxpfifo_tlast <= sbu2cxpfifo_tlast_in;
    sbu2nwpfifo_vld <= sbu2nwpfifo_vld_in;
    sbu2nwpfifo_rdy <= sbu2nwpfifo_rdy_in;
    sbu2nwpfifo_tlast <= sbu2nwpfifo_tlast_in;
    nwp2sbu_lossless_credits <= nwp2sbu_lossless_credits_in;
    cxp2sbu_lossless_credits <= cxp2sbu_lossless_credits_in;
    ik2map_axi4mm_aw_rdy <= ik2map_axi4mm_aw_rdy_in;
    ik2map_axi4mm_aw_vld <= ik2map_axi4mm_aw_vld_in;
    axi4mm_aw_rdy <= axi4mm_aw_rdy_in;
    axi4mm_aw_vld <= axi4mm_aw_vld_in;
    axi4mm_w_rdy <= axi4mm_w_rdy_in;
    axi4mm_w_vld <= axi4mm_w_vld_in;
    axi4mm_w_last <= axi4mm_w_last_in;
    axi4mm_b_rdy <= axi4mm_b_rdy_in;
    axi4mm_b_vld <= axi4mm_b_vld_in;
    ik2map_axi4mm_ar_rdy <= ik2map_axi4mm_ar_rdy_in;
    ik2map_axi4mm_ar_vld <= ik2map_axi4mm_ar_vld_in;
    axi4mm_ar_rdy <= axi4mm_ar_rdy_in;
    axi4mm_ar_vld <= axi4mm_ar_vld_in;
    axi4mm_r_rdy <= axi4mm_r_rdy_in;
    axi4mm_r_vld <= axi4mm_r_vld_in;
    axi4mm_r_last <= axi4mm_r_last_in;
    ik2map_axi4mm_aw_addr <= ik2map_axi4mm_aw_addr_in;
    ik2map_axi4mm_ar_addr <= ik2map_axi4mm_ar_addr_in;
    sbu2mlx_axi4mm_aw_addr <= sbu2mlx_axi4mm_aw_addr_in;
    sbu2mlx_axi4mm_ar_addr <= sbu2mlx_axi4mm_ar_addr_in;

    nica_events <= nica_events_in;
    dram_ctrl <= dram_ctrl_in;
  end

  wire        sigmon_reset;
  reg [1:0]   axi_rstate;
  reg [1:0]   axi_rnext;
  reg [31:0]  axi_rdata;
  wire 	      axi_aw_hs;
  wire 	      axi_w_hs;
  reg [1:0]   axi_wstate;
  reg [1:0]   axi_wnext;
  reg [AXILITE_ADDR_WIDTH-1 : 0] axi_waddr;
  wire [AXILITE_ADDR_WIDTH-1 : 0] axi_raddr;
  wire [15:0] events_in;
  wire 	      nwp2sbu_lossless_credits_on;
  wire 	      nwp2sbu_lossless_credits_off;
  wire 	      cxp2sbu_lossless_credits_on;
  wire 	      cxp2sbu_lossless_credits_off;
  reg 	      nwp2sbu_lossless_creditsQ;
  reg 	      cxp2sbu_lossless_creditsQ;
  reg 	      events_mon0_in1;  
  reg 	      events_mon0_in1_en;
  reg 	      events_mon0_in2;  
  reg 	      events_mon0_in2_en;
  reg 	      events_mon1_in1;  
  reg 	      events_mon1_in1_en;
  reg 	      events_mon1_in2;  
  reg 	      events_mon1_in2_en;
  reg 	      events_mon2_in1;  
  reg 	      events_mon2_in1_en;
  reg 	      events_mon2_in2;  
  reg 	      events_mon2_in2_en;
  reg 	      events_mon3_in1;  
  reg 	      events_mon3_in1_en;
  reg 	      events_mon3_in2;  
  reg 	      events_mon3_in2_en;
  reg 	      events_mon4_in1;  
  reg 	      events_mon4_in1_en;
  reg 	      events_mon4_in2;  
  reg 	      events_mon4_in2_en;
  reg 	      events_mon5_in1;  
  reg 	      events_mon5_in1_en;
  reg 	      events_mon5_in2;  
  reg 	      events_mon5_in2_en;
  reg 	      events_mon6_in1;  
  reg 	      events_mon6_in1_en;
  reg 	      events_mon6_in2;  
  reg 	      events_mon6_in2_en;
  reg [47:0]  events_mon6_datain;  
  reg 	      events_mon7_in1;  
  reg 	      events_mon7_in1_en;
  reg 	      events_mon7_in2;  
  reg 	      events_mon7_in2_en;
  reg [47:0]  events_mon7_datain;  
  reg 	      count0_enable;
  reg 	      count0_event;
  reg 	      count1_enable;
  reg 	      count1_event;
  reg 	      count2_enable;
  reg 	      count2_event;
  reg 	      count3_enable;
  reg 	      count3_event;
  wire [15:0]  count_events;
  reg 	      monitoring_enable;
  reg 	      test_mode_start, test_mode_end;
  reg 	      test_modeQ;

  wire 	      clb0_out, clb1_out, clb2_out, clb3_out; 
  wire [2:0]  clb0_events;
  wire [2:0]  clb1_events;
  wire [2:0]  clb2_events;
  wire [2:0]  clb3_events;
  



  reg sigmon_fifo_wr;
  reg sigmon_fifo_rd2axi;
  wire sigmon_fifo_rd;
  wire [17:0] sigmon_fifo_data_count;
  wire [31:0] sigmon_fifo_din;
  wire [31:0] sigmon_fifo_dout;
  wire 	      sigmon_fifo_valid;
  wire 	      sigmon_fifo_full;
  wire 	      sigmon_fifo_empty;
  wire 	      almost_full,wr_ack,sigmon_fifo_overflow,almost_empty,sigmon_fifo_underflow,wr_rst_busy,rd_rst_busy;

  reg [31:0]  sigmon_ctrl1;
  reg [31:0]  sigmon_ctrl2;
  reg [31:0]  sigmon_ctrl3;
  reg [31:0]  sigmon_ctrl4;
  reg [31:0]  sigmon_ctrl5;
  reg [31:0]  sigmon_ctrl9;
  reg [31:0]  sigmon_ctrl10;
  reg [31:0]  sigmon_ctrl11;
  reg [31:0]  sigmon_ctrl12;
  reg [31:0]  sigmon_ctrl13;
  reg [31:0]  sigmon_ctrl14;
  reg [31:0]  sigmon_ctrl15;
  reg [31:0]  sigmon_ctrl16;
  reg [31:0]  sigmon_ctrl17;
  reg [31:0]  sigmon_ctrl18;
  reg [31:0]  sigmon_ctrl19;
  reg [31:0]  sigmon_ctrl20;
  reg [31:0]  sigmon_ctrl21;
  reg [31:0]  sigmon_ctrl22;
  reg [31:0]  sigmon_ctrl100;
  reg [31:0]  sigmon_ctrl104;
  reg [31:0]  sigmon_ctrl110;
  reg [31:0]  sigmon_ctrl114;
  reg [31:0]  sigmon_ctrl120;
  reg [31:0]  sigmon_ctrl124;
  reg [31:0]  sigmon_ctrl130;
  reg [31:0]  sigmon_ctrl134;
  reg [31:0]  sigmon_ctrl140;
  reg [31:0]  sigmon_ctrl144;
  reg [31:0]  sigmon_ctrl150;
  reg [31:0]  sigmon_ctrl154;
  reg [31:0]  sigmon_ctrl160;
  reg [31:0]  sigmon_ctrl164;
  reg [31:0]  sigmon_ctrl170;
  reg [31:0]  sigmon_ctrl174;
  reg [31:0]  sigmon_ctrl180;
  reg [31:0]  sigmon_ctrl184;
  reg [31:0]  sigmon_ctrl190;
  reg [31:0]  sigmon_ctrl194;
  reg [31:0]  sigmon_ctrl1a0;
  reg [31:0]  sigmon_ctrl1a4;
  reg [31:0]  sigmon_ctrl1b0;
  reg [31:0]  sigmon_ctrl1b4;
  reg [31:0]  sigmon_stream0_pattern_ctrl1;
  reg [31:0]  sigmon_stream0_pattern_ctrl2;
  reg [31:0]  sigmon_stream0_pattern_h;
  reg [31:0]  sigmon_stream0_pattern_l;
  reg [31:0]  sigmon_stream1_pattern_ctrl1;
  reg [31:0]  sigmon_stream1_pattern_ctrl2;
  reg [31:0]  sigmon_stream1_pattern_h;
  reg [31:0]  sigmon_stream1_pattern_l;
  reg [31:0]  sigmon_stream2_pattern_ctrl1;
  reg [31:0]  sigmon_stream2_pattern_ctrl2;
  reg [31:0]  sigmon_stream2_pattern_h;
  reg [31:0]  sigmon_stream2_pattern_l;
  reg [31:0]  sigmon_stream3_pattern_ctrl1;
  reg [31:0]  sigmon_stream3_pattern_ctrl2;
  reg [31:0]  sigmon_stream3_pattern_h;
  reg [31:0]  sigmon_stream3_pattern_l;
  wire [31:0]  sigmon_status;
  wire [31:0]  sigmon_clbs_status;
  reg 	      counter_enable;
  reg 	      sigmon_enable_asserted;
  reg 	      sigmon_enable_assertedQ;
  reg 	      sigmon_enable_event;
  wire 	      dram_test_enabled;
  reg 	      dram_test_enable_asserted;
  reg 	      dram_test_enable_assertedQ;
  reg [3:0]   dram_test_enable_assert_width;

  wire [31:0] count0_data;
  wire [31:0] count1_data;
  wire [31:0] count2_data;
  wire [31:0] count3_data;
  wire [31:0] count4_data;
  wire [31:0] count5_data;
  wire [31:0] count6_data;
  wire [31:0] count7_data;
  wire [31:0] count8_data;
  wire [31:0] count9_data;
  wire [31:0] count10_data;
  wire [31:0] count11_data;

  reg 	      stream0_pattern_enable;
  reg 	      stream0_pattern_disable;
  wire        stream0_match_event;
  wire 	      stream0_sample_event;
  wire 	      stream0_merged_event;
  wire [47:0] stream0_sample_data;
  reg 	      stream0_vld;
  reg 	      stream0_rdy;
  reg 	      stream0_tlast;
  reg [255:0] stream0_data;

  reg 	      stream1_pattern_enable;
  reg 	      stream1_pattern_disable;
  wire 	      stream1_match_event;
  wire 	      stream1_sample_event;
  wire 	      stream1_merged_event;
  wire [47:0] stream1_sample_data;
  reg 	      stream1_vld;
  reg 	      stream1_rdy;
  reg 	      stream1_tlast;
  reg [255:0] stream1_data;

  reg 	      stream2_pattern_enable;
  reg 	      stream2_pattern_disable;
  wire 	      stream2_match_event;
  wire 	      stream2_sample_event;
  wire 	      stream2_merged_event;
  wire [47:0] stream2_sample_data;
  reg 	      stream2_vld;
  reg 	      stream2_rdy;
  reg 	      stream2_tlast;
  reg [255:0] stream2_data;

  reg 	      stream3_pattern_enable;
  reg 	      stream3_pattern_disable;
  wire 	      stream3_match_event;
  wire 	      stream3_sample_event;
  wire 	      stream3_merged_event;
  wire [47:0] stream3_sample_data;
  reg 	      stream3_vld;
  reg 	      stream3_rdy;
  reg 	      stream3_tlast;
  reg [255:0] stream3_data;

//------------------------Local AXI read fsm------------------
//
assign axi_ARREADY = (axi_rstate == RDIDLE);
assign axi_RDATA   = axi_rdata;
assign axi_RRESP   = 2'b00;  // OKAY
assign axi_RVALID  = (axi_rstate == RDDATA);
assign axi_raddr = axi_ARADDR[AXILITE_ADDR_WIDTH-1 : 0];

// rstate
  always @(posedge clk) begin
    if (reset) begin
      axi_rstate <= RDIDLE;
    end
    else begin
      axi_rstate <= axi_rnext;
    end
  end
  
// rnext
always @(*) begin
    case (axi_rstate)
        RDIDLE:
            if (axi_ARVALID)
                axi_rnext = RDDATA;
            else
                axi_rnext = RDIDLE;
        RDDATA:
          if (axi_RREADY & axi_RVALID)
            axi_rnext = RDIDLE;
          else
            axi_rnext = RDDATA;
      default:
        axi_rnext = RDIDLE;
    endcase
end

// rdata
always @(posedge clk) begin
  if (reset)
      sigmon_fifo_rd2axi <= 1'b0;
  else if (axi_ARVALID & axi_ARREADY) begin
    axi_rdata <= 32'h00000000;

    if ((axi_raddr == ADDR_SIGMON_FIFO_DATA) & ~sigmon_fifo_empty) begin
      axi_rdata <= sigmon_fifo_dout;
      sigmon_fifo_rd2axi <= 1'b1;
    end
    else
// Attempt to read from an empty fifo: 
      axi_rdata <= 32'hdeadf00d;
      
    if (axi_raddr == ADDR_SIGMON_FIFO_STATUS) begin
      axi_rdata <= sigmon_status;
    end

    if (axi_raddr == ADDR_SIGMON_CLBS_STATUS) begin
      axi_rdata <= sigmon_clbs_status;
    end

// Reading event counters:
    if (axi_raddr == ADDR_SIGMON_CTRL104)
      axi_rdata <= count0_data;
    if (axi_raddr == ADDR_SIGMON_CTRL114)
      axi_rdata <= count1_data;
    if (axi_raddr == ADDR_SIGMON_CTRL124)
      axi_rdata <= count2_data;
    if (axi_raddr == ADDR_SIGMON_CTRL134)
      axi_rdata <= count3_data;
    if (axi_raddr == ADDR_SIGMON_CTRL144)
      axi_rdata <= count4_data;
    if (axi_raddr == ADDR_SIGMON_CTRL154)
      axi_rdata <= count5_data;
    if (axi_raddr == ADDR_SIGMON_CTRL164)
      axi_rdata <= count6_data;
    if (axi_raddr == ADDR_SIGMON_CTRL174)
      axi_rdata <= count7_data;
    if (axi_raddr == ADDR_SIGMON_CTRL184)
      axi_rdata <= count8_data;
    if (axi_raddr == ADDR_SIGMON_CTRL194)
      axi_rdata <= count9_data;
    if (axi_raddr == ADDR_SIGMON_CTRL1A4)
      axi_rdata <= count10_data;
    if (axi_raddr == ADDR_SIGMON_CTRL1B4)
      axi_rdata <= count11_data;
  end
  else   //  if (sigmon_fifo_rd2axi)
      // sigmon_fifo_rd2xi is asserted to one clock only.
      sigmon_fifo_rd2axi <= 1'b0;
end

//------------------------Local AXI write fsm------------------
//
assign axi_AWREADY = (axi_wstate == WRIDLE);
assign axi_WREADY  = (axi_wstate == WRDATA);
assign axi_BRESP   = 2'b00;  // OKAY
assign axi_BVALID  = (axi_wstate == WRRESP);
assign axi_aw_hs   = axi_AWVALID & axi_AWREADY;
assign axi_w_hs    = axi_WVALID & axi_WREADY;

// wstate
always @(posedge clk) begin
    if (reset)
        axi_wstate <= WRIDLE;
    else
        axi_wstate <= axi_wnext;
end

// wnext
always @(*) begin
    case (axi_wstate)
        WRIDLE:
            if (axi_AWVALID)
                axi_wnext = WRDATA;
            else
                axi_wnext = WRIDLE;
        WRDATA:
            if (axi_WVALID)
                axi_wnext = WRRESP;
            else
                axi_wnext = WRDATA;
        WRRESP:
            if (axi_BREADY)
                axi_wnext = WRIDLE;
            else
                axi_wnext = WRRESP;
        default:
            axi_wnext = WRIDLE;
    endcase
end

// waddr
always @(posedge clk) begin
  if (axi_aw_hs)
    axi_waddr <= axi_AWADDR[AXILITE_ADDR_WIDTH-1 : 0];
end

// writing to sigmon contrl registers
always @(posedge clk) begin
  if (reset) begin
    sigmon_ctrl1 <= 32'hff0000; // Trigger source: SIGMON_ENABLED, trigger position: 0

// Setting default selection of monitored signals: All events are disabled
    sigmon_ctrl2 <= 32'b0;
    sigmon_ctrl3 <= 32'b0;
    sigmon_ctrl4 <= 32'b0;
    sigmon_ctrl5 <= 32'b0;
    sigmon_ctrl9 <= 32'b0;
    sigmon_ctrl10 <= 32'b0;
    sigmon_ctrl11 <= 32'b0;
    sigmon_ctrl12 <= 32'b0;
    sigmon_ctrl13 <= 32'b0;
    sigmon_ctrl14 <= 32'b0;
    sigmon_ctrl15 <= 32'b0;
    sigmon_ctrl16 <= 32'b0;
    sigmon_ctrl17 <= 32'b0;
    sigmon_ctrl18 <= 32'b0;
    sigmon_ctrl19 <= 32'b0;
    sigmon_ctrl20 <= 32'b0;
    sigmon_ctrl21 <= 32'b0;
    sigmon_ctrl22 <= 32'b0;
    sigmon_ctrl100 <= 32'b0;
    sigmon_ctrl104 <= 32'b0;
    sigmon_ctrl110 <= 32'b0;
    sigmon_ctrl114 <= 32'b0;
    sigmon_ctrl120 <= 32'b0;
    sigmon_ctrl124 <= 32'b0;
    sigmon_ctrl130 <= 32'b0;
    sigmon_ctrl134 <= 32'b0;
    sigmon_ctrl140 <= 32'b0;
    sigmon_ctrl144 <= 32'b0;
    sigmon_ctrl150 <= 32'b0;
    sigmon_ctrl154 <= 32'b0;
    sigmon_ctrl160 <= 32'b0;
    sigmon_ctrl164 <= 32'b0;
    sigmon_ctrl170 <= 32'b0;
    sigmon_ctrl174 <= 32'b0;
    sigmon_ctrl180 <= 32'b0;
    sigmon_ctrl184 <= 32'b0;
    sigmon_ctrl190 <= 32'b0;
    sigmon_ctrl194 <= 32'b0;
    sigmon_ctrl1a0 <= 32'b0;
    sigmon_ctrl1a4 <= 32'b0;
    sigmon_ctrl1b0 <= 32'b0;
    sigmon_ctrl1b4 <= 32'b0;
    sigmon_stream0_pattern_ctrl1 <= 32'b0;
    sigmon_stream0_pattern_ctrl2 <= 32'b0;
    sigmon_stream0_pattern_h <= 32'b0;
    sigmon_stream0_pattern_l <= 32'b0;
    sigmon_stream1_pattern_ctrl1 <= 32'b0;
    sigmon_stream1_pattern_ctrl2 <= 32'b0;
    sigmon_stream1_pattern_h <= 32'b0;
    sigmon_stream1_pattern_l <= 32'b0;
    sigmon_stream2_pattern_ctrl1 <= 32'b0;
    sigmon_stream2_pattern_ctrl2 <= 32'b0;
    sigmon_stream2_pattern_h <= 32'b0;
    sigmon_stream2_pattern_l <= 32'b0;
    sigmon_stream3_pattern_ctrl1 <= 32'b0;
    sigmon_stream3_pattern_ctrl2 <= 32'b0;
    sigmon_stream3_pattern_h <= 32'b0;
    sigmon_stream3_pattern_l <= 32'b0;
  end
  else begin
    if (axi_w_hs && axi_waddr == ADDR_SIGMON_CTRL1)
      sigmon_ctrl1[31:0] <= axi_WDATA[31:0];
    if (axi_w_hs && axi_waddr == ADDR_SIGMON_CTRL2)
      sigmon_ctrl2[31:0] <= axi_WDATA[31:0];
    if (axi_w_hs && axi_waddr == ADDR_SIGMON_CTRL3)
      sigmon_ctrl3[31:0] <= axi_WDATA[31:0];
    if (axi_w_hs && axi_waddr == ADDR_SIGMON_CTRL4)
      sigmon_ctrl4[31:0] <= axi_WDATA[31:0];
    if (axi_w_hs && axi_waddr == ADDR_SIGMON_CTRL5)
      sigmon_ctrl5[31:0] <= axi_WDATA[31:0];
    if (axi_w_hs && axi_waddr == ADDR_SIGMON_CTRL9)
      sigmon_ctrl9[31:0] <= axi_WDATA[31:0];
    if (axi_w_hs && axi_waddr == ADDR_SIGMON_CTRL10)
      sigmon_ctrl10[31:0] <= axi_WDATA[31:0];
    if (axi_w_hs && axi_waddr == ADDR_SIGMON_CTRL11)
      sigmon_ctrl11[31:0] <= axi_WDATA[31:0];
    if (axi_w_hs && axi_waddr == ADDR_SIGMON_CTRL12)
      sigmon_ctrl12[31:0] <= axi_WDATA[31:0];
    if (axi_w_hs && axi_waddr == ADDR_SIGMON_CTRL13)
      sigmon_ctrl13[31:0] <= axi_WDATA[31:0];
    if (axi_w_hs && axi_waddr == ADDR_SIGMON_CTRL14)
      sigmon_ctrl14[31:0] <= axi_WDATA[31:0];
    if (axi_w_hs && axi_waddr == ADDR_SIGMON_CTRL15)
      sigmon_ctrl15[31:0] <= axi_WDATA[31:0];
    if (axi_w_hs && axi_waddr == ADDR_SIGMON_CTRL16)
      sigmon_ctrl16[31:0] <= axi_WDATA[31:0];
    if (axi_w_hs && axi_waddr == ADDR_SIGMON_CTRL17)
      sigmon_ctrl17[31:0] <= axi_WDATA[31:0];
    if (axi_w_hs && axi_waddr == ADDR_SIGMON_CTRL18)
      sigmon_ctrl18[31:0] <= axi_WDATA[31:0];
    if (axi_w_hs && axi_waddr == ADDR_SIGMON_CTRL19)
      sigmon_ctrl19[31:0] <= axi_WDATA[31:0];
    if (axi_w_hs && axi_waddr == ADDR_SIGMON_CTRL20)
      sigmon_ctrl20[31:0] <= axi_WDATA[31:0];
    if (axi_w_hs && axi_waddr == ADDR_SIGMON_CTRL21)
      sigmon_ctrl21[31:0] <= axi_WDATA[31:0];
    if (axi_w_hs && axi_waddr == ADDR_SIGMON_CTRL22)
      sigmon_ctrl22[31:0] <= axi_WDATA[31:0];
    if (axi_w_hs && axi_waddr == ADDR_SIGMON_CTRL100)
      sigmon_ctrl100[31:0] <= axi_WDATA[31:0];
    if (axi_w_hs && axi_waddr == ADDR_SIGMON_CTRL104)
      sigmon_ctrl104[31:0] <= axi_WDATA[31:0];
    if (axi_w_hs && axi_waddr == ADDR_SIGMON_CTRL110)
      sigmon_ctrl110[31:0] <= axi_WDATA[31:0];
    if (axi_w_hs && axi_waddr == ADDR_SIGMON_CTRL114)
      sigmon_ctrl114[31:0] <= axi_WDATA[31:0];
    if (axi_w_hs && axi_waddr == ADDR_SIGMON_CTRL120)
      sigmon_ctrl120[31:0] <= axi_WDATA[31:0];
    if (axi_w_hs && axi_waddr == ADDR_SIGMON_CTRL124)
      sigmon_ctrl124[31:0] <= axi_WDATA[31:0];
    if (axi_w_hs && axi_waddr == ADDR_SIGMON_CTRL130)
      sigmon_ctrl130[31:0] <= axi_WDATA[31:0];
    if (axi_w_hs && axi_waddr == ADDR_SIGMON_CTRL134)
      sigmon_ctrl134[31:0] <= axi_WDATA[31:0];
    if (axi_w_hs && axi_waddr == ADDR_SIGMON_CTRL140)
      sigmon_ctrl140[31:0] <= axi_WDATA[31:0];
    if (axi_w_hs && axi_waddr == ADDR_SIGMON_CTRL144)
      sigmon_ctrl144[31:0] <= axi_WDATA[31:0];
    if (axi_w_hs && axi_waddr == ADDR_SIGMON_CTRL150)
      sigmon_ctrl150[31:0] <= axi_WDATA[31:0];
    if (axi_w_hs && axi_waddr == ADDR_SIGMON_CTRL154)
      sigmon_ctrl154[31:0] <= axi_WDATA[31:0];
    if (axi_w_hs && axi_waddr == ADDR_SIGMON_CTRL160)
      sigmon_ctrl160[31:0] <= axi_WDATA[31:0];
    if (axi_w_hs && axi_waddr == ADDR_SIGMON_CTRL164)
      sigmon_ctrl164[31:0] <= axi_WDATA[31:0];
    if (axi_w_hs && axi_waddr == ADDR_SIGMON_CTRL170)
      sigmon_ctrl170[31:0] <= axi_WDATA[31:0];
    if (axi_w_hs && axi_waddr == ADDR_SIGMON_CTRL174)
      sigmon_ctrl174[31:0] <= axi_WDATA[31:0];
    if (axi_w_hs && axi_waddr == ADDR_SIGMON_CTRL180)
      sigmon_ctrl180[31:0] <= axi_WDATA[31:0];
    if (axi_w_hs && axi_waddr == ADDR_SIGMON_CTRL184)
      sigmon_ctrl184[31:0] <= axi_WDATA[31:0];
    if (axi_w_hs && axi_waddr == ADDR_SIGMON_CTRL190)
      sigmon_ctrl190[31:0] <= axi_WDATA[31:0];
    if (axi_w_hs && axi_waddr == ADDR_SIGMON_CTRL194)
      sigmon_ctrl194[31:0] <= axi_WDATA[31:0];
    if (axi_w_hs && axi_waddr == ADDR_SIGMON_CTRL1A0)
      sigmon_ctrl1a0[31:0] <= axi_WDATA[31:0];
    if (axi_w_hs && axi_waddr == ADDR_SIGMON_CTRL1A4)
      sigmon_ctrl1a4[31:0] <= axi_WDATA[31:0];
    if (axi_w_hs && axi_waddr == ADDR_SIGMON_CTRL1B0)
      sigmon_ctrl1b0[31:0] <= axi_WDATA[31:0];
    if (axi_w_hs && axi_waddr == ADDR_SIGMON_CTRL1B4)
      sigmon_ctrl1b4[31:0] <= axi_WDATA[31:0];
    if (axi_w_hs && axi_waddr == ADDR_SIGMON_STREAM0_PATTERN_CTRL1)
      sigmon_stream0_pattern_ctrl1[31:0] <= axi_WDATA[31:0];
    if (axi_w_hs && axi_waddr == ADDR_SIGMON_STREAM0_PATTERN_CTRL2)
      sigmon_stream0_pattern_ctrl2[31:0] <= axi_WDATA[31:0];
    if (axi_w_hs && axi_waddr == ADDR_SIGMON_STREAM0_PATTERN_H)
      sigmon_stream0_pattern_h[31:0] <= axi_WDATA[31:0];
    if (axi_w_hs && axi_waddr == ADDR_SIGMON_STREAM0_PATTERN_L)
      sigmon_stream0_pattern_l[31:0] <= axi_WDATA[31:0];
    if (axi_w_hs && axi_waddr == ADDR_SIGMON_STREAM1_PATTERN_CTRL1)
      sigmon_stream1_pattern_ctrl1[31:0] <= axi_WDATA[31:0];
    if (axi_w_hs && axi_waddr == ADDR_SIGMON_STREAM1_PATTERN_CTRL2)
      sigmon_stream1_pattern_ctrl2[31:0] <= axi_WDATA[31:0];
    if (axi_w_hs && axi_waddr == ADDR_SIGMON_STREAM1_PATTERN_H)
      sigmon_stream1_pattern_h[31:0] <= axi_WDATA[31:0];
    if (axi_w_hs && axi_waddr == ADDR_SIGMON_STREAM1_PATTERN_L)
      sigmon_stream1_pattern_l[31:0] <= axi_WDATA[31:0];
    if (axi_w_hs && axi_waddr == ADDR_SIGMON_STREAM2_PATTERN_CTRL1)
      sigmon_stream2_pattern_ctrl1[31:0] <= axi_WDATA[31:0];
    if (axi_w_hs && axi_waddr == ADDR_SIGMON_STREAM2_PATTERN_CTRL2)
      sigmon_stream2_pattern_ctrl2[31:0] <= axi_WDATA[31:0];
    if (axi_w_hs && axi_waddr == ADDR_SIGMON_STREAM2_PATTERN_H)
      sigmon_stream2_pattern_h[31:0] <= axi_WDATA[31:0];
    if (axi_w_hs && axi_waddr == ADDR_SIGMON_STREAM2_PATTERN_L)
      sigmon_stream2_pattern_l[31:0] <= axi_WDATA[31:0];
    if (axi_w_hs && axi_waddr == ADDR_SIGMON_STREAM3_PATTERN_CTRL1)
      sigmon_stream3_pattern_ctrl1[31:0] <= axi_WDATA[31:0];
    if (axi_w_hs && axi_waddr == ADDR_SIGMON_STREAM3_PATTERN_CTRL2)
      sigmon_stream3_pattern_ctrl2[31:0] <= axi_WDATA[31:0];
    if (axi_w_hs && axi_waddr == ADDR_SIGMON_STREAM3_PATTERN_H)
      sigmon_stream3_pattern_h[31:0] <= axi_WDATA[31:0];
    if (axi_w_hs && axi_waddr == ADDR_SIGMON_STREAM3_PATTERN_L)
      sigmon_stream3_pattern_l[31:0] <= axi_WDATA[31:0];
  end
end

  
// sigmon status:
`ifdef FIFO_128K
  assign sigmon_status[17:0] = sigmon_fifo_data_count[17:0];
`else
  assign sigmon_status[17:0] = {1'b0, sigmon_fifo_data_count[16:0]};
`endif

  assign sigmon_status[19:18] = 2'b00; // reserved
  assign sigmon_status[20] = sigmon_fifo_valid;
  assign sigmon_status[21] = trigger_occurred;
  assign sigmon_status[23:22] = 2'b00; // reserved  
  assign sigmon_status[31:24] = events_data_loss;

  assign sigmon_reset = reset | sigmon_enable_asserted;
  assign sigmon_fifo_din = event_fifo_data[31:0];

// Look for sigmon_enable (sigmon_ctrl1[31]) assertion
always @(posedge clk) begin
  if (reset) begin
    sigmon_enable_asserted <= 0;
    sigmon_enable_assertedQ <= 0;
    sigmon_enable_event <= 0;
    counter_enable <= 0;    
  end
  else begin
    sigmon_enable_assertedQ <= sigmon_ctrl1[31];

// sigmon_ctrl1[31] assertion is used to reset both time stamp counter and the sigmon_fifo
    if (sigmon_ctrl1[31] & ~sigmon_enable_assertedQ)
      sigmon_enable_asserted <= 1;
    else 
      sigmon_enable_asserted <= 0;

// sigmon_enable_event: signalling start of monitoring, can be selected for monitoring/trigerring:
    if (sigmon_enable_asserted & sigmon_enable_assertedQ)
      sigmon_enable_event <= 1;
    else 
      sigmon_enable_event <= 0;

  end // else: !if(reset)
end

  wire sbu2cxpfifo_eop;
  wire sbu2cxp_eop;
  wire cxp2sbu_eop;
  wire sbu2nwpfifo_eop;
  wire sbu2nwp_eop;
  wire nwp2sbu_eop;
  wire nwp2sbu_eop_temp;
  reg  sbu2cxpfifo_eopQ;
  reg  sbu2cxp_eopQ;
  reg  cxp2sbu_eopQ;
  reg  sbu2nwpfifo_eopQ;
  reg  sbu2nwp_eopQ;
  reg  nwp2sbu_eopQ;
  wire sbu2cxpfifo_sop;
  wire sbu2cxp_sop;
  wire cxp2sbu_sop;
  wire sbu2nwpfifo_sop;
  wire sbu2nwp_sop;
  wire nwp2sbu_sop;
  wire got_ikwaddr;
  wire got_ddrwaddr;
  wire got_ddrwdata;
  wire got_ddrwdone;
  wire got_ikraddr;
  wire got_ddrraddr;
  wire got_ddrrdata;
  reg  got_ikwaddrQ;
  reg  got_ddrwaddrQ;
  reg  got_ddrwdataQ;
  reg  got_ddrwdoneQ;
  reg  got_ikraddrQ;
  reg  got_ddrraddrQ;
  reg  got_ddrrdataQ;
  wire no_event;

  assign sbu2cxpfifo_sop = sbu2cxpfifo_eopQ & sbu2cxpfifo_vld & sbu2cxpfifo_rdy;
  assign sbu2cxpfifo_eop = sbu2cxpfifo_tlast & sbu2cxpfifo_vld & sbu2cxpfifo_rdy;
  assign sbu2cxp_sop = sbu2cxp_eopQ & sbu2cxp_vld & sbu2cxp_rdy;
  assign sbu2cxp_eop = sbu2cxp_tlast & sbu2cxp_vld & sbu2cxp_rdy;
  assign cxp2sbu_sop = cxp2sbu_eopQ & cxp2sbu_vld & cxp2sbu_rdy;
  assign cxp2sbu_eop = cxp2sbu_tlast & cxp2sbu_vld & cxp2sbu_rdy;

  assign sbu2nwpfifo_sop = sbu2nwpfifo_eopQ & sbu2nwpfifo_vld & sbu2nwpfifo_rdy;
  assign sbu2nwpfifo_eop = sbu2nwpfifo_tlast & sbu2nwpfifo_vld & sbu2nwpfifo_rdy;
  assign sbu2nwp_sop = sbu2nwp_eopQ & sbu2nwp_vld & sbu2nwp_rdy;
  assign sbu2nwp_eop = sbu2nwp_tlast & sbu2nwp_vld & sbu2nwp_rdy;
  assign nwp2sbu_sop = nwp2sbu_eopQ & nwp2sbu_vld & nwp2sbu_rdy;
  assign nwp2sbu_eop = nwp2sbu_tlast & nwp2sbu_vld & nwp2sbu_rdy;
  assign nwp2sbu_eop_temp = nwp2sbu_tlast & nwp2sbu_vld & nwp2sbu_rdy_temp;

  assign nwp2sbu_lossless_credits_on  = ~nwp2sbu_lossless_creditsQ &  nwp2sbu_lossless_credits;
  assign nwp2sbu_lossless_credits_off  =  nwp2sbu_lossless_creditsQ & ~nwp2sbu_lossless_credits;
  assign cxp2sbu_lossless_credits_on  = ~cxp2sbu_lossless_creditsQ &  cxp2sbu_lossless_credits;
  assign cxp2sbu_lossless_credits_off  =  cxp2sbu_lossless_creditsQ & ~cxp2sbu_lossless_credits;


  assign got_ikwaddr = ik2map_axi4mm_aw_rdy & ik2map_axi4mm_aw_vld;
  assign got_ddrwaddr = axi4mm_aw_rdy & axi4mm_aw_vld;
  assign got_ddrwdata = axi4mm_w_rdy & axi4mm_w_vld;
  assign got_ddrwdone = axi4mm_b_rdy & axi4mm_b_vld;
  assign got_ikraddr = ik2map_axi4mm_ar_rdy & ik2map_axi4mm_ar_vld;
  assign got_ddrraddr = axi4mm_ar_rdy & axi4mm_ar_vld;
  assign got_ddrrdata = axi4mm_r_rdy & axi4mm_r_vld;
  assign dram_test_enabled = dram_ctrl[0];

// Mark transactions events at each axi4mm interface
always @(posedge clk) begin
  if (sigmon_reset) begin
    got_ikwaddrQ <= 1'b0;
    got_ddrwaddrQ <= 1'b0;
    got_ddrwdataQ <= 1'b0;
    got_ddrwdoneQ <= 1'b0;
    got_ikraddrQ <= 1'b0;
    got_ddrraddrQ <= 1'b0;
    got_ddrrdataQ <= 1'b0;
  end
  else begin
// Write address event (at ikernel interface):
    if (got_ikwaddr) begin
       got_ikwaddrQ <= 1'b1;
    end
    else begin
       got_ikwaddrQ <= 1'b0;
    end

// Write address event:
    if (got_ddrwaddr) begin
       got_ddrwaddrQ <= 1'b1;
    end
    else begin
       got_ddrwaddrQ <= 1'b0;
    end

// Write data event:
    if (got_ddrwdata) begin
       got_ddrwdataQ <= 1'b1;
    end
    else begin
       got_ddrwdataQ <= 1'b0;
    end

// Write response event:
    if (got_ddrwdone) begin
       got_ddrwdoneQ <= 1'b1;
    end
    else begin
       got_ddrwdoneQ <= 1'b0;
    end

// Read address event (at ikernel interface):
    if (got_ikraddr) begin
       got_ikraddrQ <= 1'b1;
    end
    else begin
       got_ikraddrQ <= 1'b0;
    end
    
// Read address event:
    if (got_ddrraddr) begin
       got_ddrraddrQ <= 1'b1;
    end
    else begin
       got_ddrraddrQ <= 1'b0;
    end
    
// Read data event:
    if (got_ddrrdata) begin
       got_ddrrdataQ <= 1'b1;
    end
    else begin
       got_ddrrdataQ <= 1'b0;
    end

  end
end


// Mark packets end at each axi-stream interface
// This indication is used to generate next packet start (*_sop) indication
always @(posedge clk) begin
  if (sigmon_reset) begin
    nwp2sbu_lossless_creditsQ <= 1'b0;
    cxp2sbu_lossless_creditsQ <= 1'b0;

// asserted at reset, assuming correct sequence of packets at all streams
// thus to assert *_sop indication, upon begin of packets stream  
    sbu2cxpfifo_eopQ <= 1'b1;
    sbu2cxp_eopQ <= 1'b1;
    cxp2sbu_eopQ <= 1'b1;
    sbu2nwpfifo_eopQ <= 1'b1;
    sbu2nwp_eopQ <= 1'b1;
    nwp2sbu_eopQ <= 1'b1;
  end
  else begin

// sbu2cxpfifo:
    if (sbu2cxpfifo_vld & sbu2cxpfifo_rdy) begin
      if (sbu2cxpfifo_tlast)
	sbu2cxpfifo_eopQ <= 1;
      else
	sbu2cxpfifo_eopQ <= 0;
    end
    
// sbu2cxp:
    if (sbu2cxp_vld & sbu2cxp_rdy) begin
      if (sbu2cxp_tlast)
	sbu2cxp_eopQ <= 1;
      else
	sbu2cxp_eopQ <= 0;
    end
    
// cxp2sbu:
    if (cxp2sbu_vld & cxp2sbu_rdy) begin
      if (cxp2sbu_tlast)
	cxp2sbu_eopQ <= 1;
      else
	cxp2sbu_eopQ <= 0;
    end
      
// sbu2nwpfifo:
    if (sbu2nwpfifo_vld & sbu2nwpfifo_rdy) begin
      if (sbu2nwpfifo_tlast)
	sbu2nwpfifo_eopQ <= 1;
      else
	sbu2nwpfifo_eopQ <= 0;
    end
      
// sbu2nwp:
    if (sbu2nwp_vld & sbu2nwp_rdy) begin
      if (sbu2nwp_tlast)
	sbu2nwp_eopQ <= 1;
      else
	sbu2nwp_eopQ <= 0;
    end

// nwp2sbu:
    if (nwp2sbu_vld & nwp2sbu_rdy) begin
      if (nwp2sbu_tlast)
	nwp2sbu_eopQ <= 1;
      else
	nwp2sbu_eopQ <= 0;
    end
    
// cxp2sbu & nwp2sbu credits:
    nwp2sbu_lossless_creditsQ <= nwp2sbu_lossless_credits;
    cxp2sbu_lossless_creditsQ <= cxp2sbu_lossless_credits;
    
  end
end


  
////////////////////////////////////////////////////////////////////////
// Load from the various events fifos to main sigmon fifo:

  localparam
    RW_IDLE                    = 2'd0,
    RW_SELECT                  = 2'd1,
    RW_DATA                    = 2'd2;

  reg [10:0] current_transfer_count;  
  reg [2:0]  rw_state;
  wire 	     more_events_valid;
  
  assign more_events_valid = (events_valid[7:0] > 0) ? 1'b1 : 1'b0;
  assign events_valid_dup[7:0] = events_valid[7:0];
  assign events_valid_dup[15:8] = events_valid[7:0];
  
// Determine next event fifo to be read:
  always @(*) begin
    case (event_index)
     0: begin
	  event_index_p1 <= events_valid_dup[1];
	  event_index_p2 <= events_valid_dup[2];
	  event_index_p3 <= events_valid_dup[3];
	  event_index_p4 <= events_valid_dup[4];
	  event_index_p5 <= events_valid_dup[5];
	  event_index_p6 <= events_valid_dup[6];
	  event_index_p7 <= events_valid_dup[7];
	  event_index_p8 <= events_valid_dup[8];
	  event_valid <= events_valid[0];	
	  event_fifo_data <= event0_fifo_data[31:0];
	  event_fifo_implied_data <= event0_fifo_data[35] & events_valid[0];
	  event_fifo_data_count <= event0_fifo_data_count;
	  event_read = 8'b00000001;
	end
      1: begin
	  event_index_p1 <= events_valid_dup[2];
	  event_index_p2 <= events_valid_dup[3];
	  event_index_p3 <= events_valid_dup[4];
	  event_index_p4 <= events_valid_dup[5];
	  event_index_p5 <= events_valid_dup[6];
	  event_index_p6 <= events_valid_dup[7];
	  event_index_p7 <= events_valid_dup[8];
     	  event_index_p8 <= events_valid_dup[9];
	  event_valid <= events_valid[1];	
	  event_fifo_data <= event1_fifo_data[31:0];
	  event_fifo_implied_data <= event1_fifo_data[35] & events_valid[1];
	  event_fifo_data_count <= event1_fifo_data_count;
	  event_read <= 8'b00000010;
	end
      2: begin
	  event_index_p1 <= events_valid_dup[3];
	  event_index_p2 <= events_valid_dup[4];
	  event_index_p3 <= events_valid_dup[5];
	  event_index_p4 <= events_valid_dup[6];
	  event_index_p5 <= events_valid_dup[7];
	  event_index_p6 <= events_valid_dup[8];
	  event_index_p7 <= events_valid_dup[9];
	  event_index_p8 <= events_valid_dup[10];
	  event_valid <= events_valid[2];	
	  event_fifo_data <= event2_fifo_data[31:0];
	  event_fifo_implied_data <= event2_fifo_data[35] & events_valid[2];
	  event_fifo_data_count <= event2_fifo_data_count;
	  event_read <= 8'b00000100;
	end
      3: begin
	  event_index_p1 <= events_valid_dup[4];
	  event_index_p2 <= events_valid_dup[5];
	  event_index_p3 <= events_valid_dup[6];
	  event_index_p4 <= events_valid_dup[7];
	  event_index_p5 <= events_valid_dup[8];
	  event_index_p6 <= events_valid_dup[9];
	  event_index_p7 <= events_valid_dup[10];
	  event_index_p8 <= events_valid_dup[11];
	  event_valid <= events_valid[3];	
	  event_fifo_data <= event3_fifo_data[31:0];
	  event_fifo_implied_data <= event3_fifo_data[35] & events_valid[3];
	  event_fifo_data_count <= event3_fifo_data_count;
	  event_read <= 8'b00001000;
	end
      4: begin
	  event_index_p1 <= events_valid_dup[5];
	  event_index_p2 <= events_valid_dup[6];
	  event_index_p3 <= events_valid_dup[7];
	  event_index_p4 <= events_valid_dup[8];
	  event_index_p5 <= events_valid_dup[9];
	  event_index_p6 <= events_valid_dup[10];
	  event_index_p7 <= events_valid_dup[11];
	  event_index_p8 <= events_valid_dup[12];
	  event_valid <= events_valid[4];	
	  event_fifo_data <= event4_fifo_data[31:0];
	  event_fifo_implied_data <= event4_fifo_data[35] & events_valid[4];
	  event_fifo_data_count <= event4_fifo_data_count;
	  event_read <= 8'b00010000;
	end
      5: begin
	  event_index_p1 <= events_valid_dup[6];
	  event_index_p2 <= events_valid_dup[7];
	  event_index_p3 <= events_valid_dup[8];
	  event_index_p4 <= events_valid_dup[9];
	  event_index_p5 <= events_valid_dup[10];
	  event_index_p6 <= events_valid_dup[11];
	  event_index_p7 <= events_valid_dup[12];
	  event_index_p8 <= events_valid_dup[13];
	  event_valid <= events_valid[5];	
	  event_fifo_data <= event5_fifo_data[31:0];
	  event_fifo_implied_data <= event5_fifo_data[35] & events_valid[5];
	  event_fifo_data_count <= event5_fifo_data_count;
	  event_read <= 8'b00100000;
	end
      6: begin
	  event_index_p1 <= events_valid_dup[7];
	  event_index_p2 <= events_valid_dup[8];
	  event_index_p3 <= events_valid_dup[9];
	  event_index_p4 <= events_valid_dup[10];
	  event_index_p5 <= events_valid_dup[11];
	  event_index_p6 <= events_valid_dup[12];
	  event_index_p7 <= events_valid_dup[13];
	  event_index_p8 <= events_valid_dup[14];
	  event_valid <= events_valid[6];	
	  event_fifo_data <= event6_fifo_data[31:0];
	  event_fifo_implied_data <= event6_fifo_data[35] & events_valid[6];
	  event_fifo_data_count <= event6_fifo_data_count;
	  event_read <= 8'b01000000;
	end
      7: begin
	  event_index_p1 <= events_valid_dup[8];
	  event_index_p2 <= events_valid_dup[9];
	  event_index_p3 <= events_valid_dup[10];
	  event_index_p4 <= events_valid_dup[11];
	  event_index_p5 <= events_valid_dup[12];
	  event_index_p6 <= events_valid_dup[13];
	  event_index_p7 <= events_valid_dup[14];
	  event_index_p8 <= events_valid_dup[15];
	  event_valid <= events_valid[7];	
	  event_fifo_data <= event7_fifo_data[31:0];
	  event_fifo_implied_data <= event7_fifo_data[35] & events_valid[7];
	  event_fifo_data_count <= event7_fifo_data_count;
	  event_read <= 8'b10000000;
	end
      
      default: 
	begin
	  event_index_p1 <= events_valid_dup[1];
	  event_index_p2 <= events_valid_dup[2];
	  event_index_p3 <= events_valid_dup[3];
	  event_index_p4 <= events_valid_dup[4];
	  event_index_p5 <= events_valid_dup[5];
	  event_index_p6 <= events_valid_dup[6];
	  event_index_p7 <= events_valid_dup[7];
	  event_index_p8 <= events_valid_dup[8];
	  event_valid <= events_valid[0];	
	  event_fifo_data <= event0_fifo_data[31:0];
	  event_fifo_implied_data <= event0_fifo_data[35] & events_valid[0];
	  event_fifo_data_count <= event0_fifo_data_count;
	  event_read <= 8'b00000000;
	end
    endcase
  end


   always @(*) begin
      if (event_index_p1) begin
	next_event_index = event_index + 1;
	no_events =  1'b0;	
      end
      else if (~event_index_p1 & event_index_p2) begin
	next_event_index = event_index + 2;
	no_events =  1'b0;	
      end
      else if (~event_index_p1 & ~event_index_p2 & event_index_p3) begin
	next_event_index = event_index + 3;
	no_events =  1'b0;	
      end
      else if (~event_index_p1 & ~event_index_p2 & ~event_index_p3 & event_index_p4) begin
	next_event_index = event_index + 4;
	no_events =  1'b0;	
      end
      else if (~event_index_p1 & ~event_index_p2 & ~event_index_p3 & ~event_index_p4 & event_index_p5) begin
	next_event_index = event_index + 5;
	no_events =  1'b0;	
      end
      else if (~event_index_p1 & ~event_index_p2 & ~event_index_p3 & ~event_index_p4 & ~event_index_p5 & event_index_p6) begin
	next_event_index = event_index + 6;
	no_events =  1'b0;	
      end
      else if (~event_index_p1 & ~event_index_p2 & ~event_index_p3 & ~event_index_p4 & ~event_index_p5 & ~event_index_p6 & event_index_p7) begin
	next_event_index = event_index + 7;
	no_events =  1'b0;	
      end
      else if (~event_index_p1 & ~event_index_p2 & ~event_index_p3 & ~event_index_p4 & ~event_index_p5 & ~event_index_p6 & ~event_index_p7 & event_index_p8) begin
	next_event_index = event_index + 8;  // This is a modulo 8 addition (actually adding 0)
	no_events =  1'b0;	
      end
      else
	// if (~event_index_p1 & ~event_index_p2 & ~event_index_p3 & ~event_index_p4 & ~event_index_p5 & ~event_index_p6 & ~event_index_p7 & ~event_index_p8) 
	begin
	  next_event_index = event_index;
	  no_events =  1'b1;	
	end
   end  

	     
  always @(posedge clk) begin
    if (reset) begin
      sigmon_fifo_wr <= 1'b0;
      event_fifo_rd <= 8'b00000000;
      event_index <= 3'b000;
      rw_state <= RW_IDLE;

    end
    else begin
      
      case (rw_state)
	RW_IDLE:
	  begin
	    sigmon_fifo_wr <= 1'b0;
	    event_fifo_rd <= 8'b00000000;
	    
	    if (more_events_valid) begin
	      event_index[2:0] <= next_event_index[2:0];
	      rw_state <= RW_SELECT;
	    end
	    else
	      rw_state <= RW_IDLE;
	  end
	
	RW_SELECT:
	  begin
	    sigmon_fifo_wr <= 1'b0;
	    event_fifo_rd <= 8'b00000000;
	    
	    // Limit transfer burst to 128 transfers max
	    current_transfer_count[10:0] <= (event_fifo_data_count[10:0] > 128) ? 128 : event_fifo_data_count[10:0];
	    rw_state <= RW_DATA;
	  end
	
	RW_DATA:
	  begin	    
	    // read/write current_transfer_count entries from selected event fifo,
	    // or as long as an implied data is present at the event_fifo output
	    if (~sigmon_fifo_full) begin
	      if  (current_transfer_count[10:0] > 0 | event_fifo_implied_data) begin
		sigmon_fifo_wr <= 1'b1;
		event_fifo_rd <= event_read;
		current_transfer_count[10:0] <= (current_transfer_count[10:0] > 0) ? current_transfer_count[10:0] - 1 :0;
		if (current_transfer_count[10:0] > 1 | event_fifo_implied_data) begin
		  rw_state <= RW_DATA;
		end
		//	      else begin
		//		rw_state <= RW_IDLE;
		//		sigmon_fifo_wr <= 1'b0;
		//		event_fifo_rd <= 8'b00000000;
		//	      end
	      end
	      
	      else begin
		// Current burst transfer ended. Prepare for next burst, if more events exist
		sigmon_fifo_wr <= 1'b0;
		event_fifo_rd <= 8'b00000000;
		event_index[2:0] <= next_event_index[2:0];
		if (more_events_valid)
		  rw_state <= RW_SELECT;
		else 
		  rw_state <= RW_IDLE;
	      end // else: !(current_transfer_count[10:0] > 0 | (event_fifo_implied_data & event_fifo_data_count[10:0] > 1))
	      
	    end // !if(~sigmon_fifo_full
	  end // case: RW_DATA
	    
	default:
	  begin
	    sigmon_fifo_wr <= 1'b0;
	    event_fifo_rd <= 8'b00000000;
	    rw_state <= RW_IDLE;
	  end
	
      endcase
    end
  end


/////////////////////////////////////////////////////////////////////////////////////////
// Test mode: 
// Optionally cancel nica to nwp pushback, by forcing nwp2sbu_rdy to 1'b1.
// The start & end time points is controlled via  sigmon_ctrl9[23:8]:
//    sigmon_ctrl9[15:8]   - Test mode start select
//    sigmon_ctrl9[23:16]  - Test model end select

//  Test mode start selector:
  always @(*) begin
    case (sigmon_ctrl9[15:8]) 
      NO_EVENT:
	begin
	  test_mode_start = 1'b0;
	end
      LOCAL_EVENT0:
	begin
	  test_mode_start = count_events[0];
	end
      LOCAL_EVENT1:
	begin
	  test_mode_start = count_events[1];
	end
      LOCAL_EVENT2:
	begin
	  test_mode_start = count_events[2];
	end
      LOCAL_EVENT3:
	begin
	  test_mode_start = count_events[3];
	end
      LOCAL_EVENT4:
	begin
	  test_mode_start = count_events[4];
	end
      LOCAL_EVENT5:
	begin
	  test_mode_start = count_events[5];
	end
      LOCAL_EVENT6:
	begin
	  test_mode_start = count_events[6];
	end
      LOCAL_EVENT7:
	begin
	  test_mode_start = count_events[7];
	end
      LOCAL_EVENT8:
	begin
	  test_mode_start = count_events[8];
	end
      LOCAL_EVENT9:
	begin
	  test_mode_start = count_events[9];
	end
      LOCAL_EVENT10:
	begin
	  test_mode_start = count_events[10];
	end
      LOCAL_EVENT11:
	begin
	  test_mode_start = count_events[11];
	end
      SIGMON_ENABLED:
	begin
	  test_mode_start = sigmon_enable_assertedQ;
	end
      default: begin
	  test_mode_start = 1'b0;
      end
    endcase
  end

//  Test mode end selector:
  always @(*) begin
    case (sigmon_ctrl9[23:16]) 
      NO_EVENT:
	begin
	  test_mode_end = 1'b0;
	end
      LOCAL_EVENT0:
	begin
	  test_mode_end = count_events[0];
	end
      LOCAL_EVENT1:
	begin
	  test_mode_end = count_events[1];
	end
      LOCAL_EVENT2:
	begin
	  test_mode_end = count_events[2];
	end
      LOCAL_EVENT3:
	begin
	  test_mode_end = count_events[3];
	end
      LOCAL_EVENT4:
	begin
	  test_mode_end = count_events[4];
	end
      LOCAL_EVENT5:
	begin
	  test_mode_end = count_events[5];
	end
      LOCAL_EVENT6:
	begin
	  test_mode_end = count_events[6];
	end
      LOCAL_EVENT7:
	begin
	  test_mode_end = count_events[7];
	end
      LOCAL_EVENT8:
	begin
	  test_mode_end = count_events[8];
	end
      LOCAL_EVENT9:
	begin
	  test_mode_end = count_events[9];
	end
      LOCAL_EVENT10:
	begin
	  test_mode_end = count_events[10];
	end
      LOCAL_EVENT11:
	begin
	  test_mode_end = count_events[11];
	end
      SIGMON_ENABLED:
	begin
	  test_mode_end = sigmon_enable_assertedQ;
	end
      default: begin
	  test_mode_end = 1'b0;
      end
    endcase
  end

  always @(posedge clk) begin
    if (reset) begin
      test_modeQ <= 1'b0;
    end
    else begin
      if (test_mode_end)
	test_modeQ <= 1'b0;
      else if (test_mode_start)
	// test_mode is asserted only if start & end are mutex !!
	test_modeQ <= 1'b1;      
    end
  end

  assign test_mode = test_modeQ;

  
////////////////////////////////////////////////////////////////////////////////////////
// Event monitors: 
//
// Currently only 8 event monitors are implemented. 
// Each event monitor captures up to 2 events. However, these events must be mutually exclusive, such that will never trigger at the same time
// An example for such events: eop & sop of same axistream interface.  
// Another example: assert and deassert of a signal, such as lossless_has_credits

//  event monitors (0 thru 7) enable:
  always @(*) begin
    case (sigmon_ctrl9[7:0]) 
      NO_EVENT:
	begin
	  monitoring_enable = 1'b0;
	end
      TIMESTAMP_24TOGGLE:
	begin
	  monitoring_enable = timestamp_counter_24toggle;
	end
      EVENT_FALSE:
	begin
	  monitoring_enable = 1'b0;
	end
      LOCAL_EVENT0:
	begin
	  monitoring_enable = count_events[0];
	end
      LOCAL_EVENT1:
	begin
	  monitoring_enable = count_events[1];
	end
      LOCAL_EVENT2:
	begin
	  monitoring_enable = count_events[2];
	end
      LOCAL_EVENT3:
	begin
	  monitoring_enable = count_events[3];
	end
      LOCAL_EVENT4:
	begin
	  monitoring_enable = count_events[4];
	end
      LOCAL_EVENT5:
	begin
	  monitoring_enable = count_events[5];
	end
      LOCAL_EVENT6:
	begin
	  monitoring_enable = count_events[6];
	end
      LOCAL_EVENT7:
	begin
	  monitoring_enable = count_events[7];
	end
      LOCAL_EVENT8:
	begin
	  monitoring_enable = count_events[8];
	end
      LOCAL_EVENT9:
	begin
	  monitoring_enable = count_events[9];
	end
      LOCAL_EVENT10:
	begin
	  monitoring_enable = count_events[10];
	end
      LOCAL_EVENT11:
	begin
	  monitoring_enable = count_events[11];
	end
      DRAM_TEST_ENABLE:
	begin
	  monitoring_enable = dram_test_enabled;
	end
      SIGMON_ENABLED:
	begin
	  monitoring_enable = sigmon_enable_assertedQ;
	end
      default: begin
	  monitoring_enable = sigmon_enable_assertedQ;
      end
    endcase
  end

  sigmon_monitors  sigmon_monitors (
 .clk(clk),
 .reset(sigmon_reset),
 .monitoring_enable(monitoring_enable),
 .sigmon_enable_event(sigmon_enable_event),
 .timestamp_counter_24toggle(timestamp_counter_24toggle),
 .nwp2sbu_sop(nwp2sbu_sop),
 .nwp2sbu_eop(nwp2sbu_eop),
 .sbu2nwp_sop(sbu2nwp_sop),
 .sbu2nwp_eop(sbu2nwp_eop),
 .cxp2sbu_sop(cxp2sbu_sop),
 .cxp2sbu_eop(cxp2sbu_eop),
 .sbu2cxp_sop(sbu2cxp_sop),
 .sbu2cxp_eop(sbu2cxp_eop),
 .sbu2cxpfifo_sop(sbu2cxpfifo_sop),
 .sbu2cxpfifo_eop(sbu2cxpfifo_eop),
 .sbu2nwpfifo_sop(sbu2nwpfifo_sop),
 .sbu2nwpfifo_eop(sbu2nwpfifo_eop),
 .nwp2sbu_lossless_credits_on(nwp2sbu_lossless_credits_on),
 .cxp2sbu_lossless_credits_on(cxp2sbu_lossless_credits_on),
 .nwp2sbu_lossless_credits_off(nwp2sbu_lossless_credits_off),
 .cxp2sbu_lossless_credits_off(cxp2sbu_lossless_credits_off),
 .got_ikwaddr(got_ikwaddr),
 .got_ikraddr(got_ikraddr),
 .got_ddrwaddr(got_ddrwaddr),
 .got_ddrwdata(got_ddrwdata),
 .got_ddrwdone(got_ddrwdone),
 .got_ddrraddr(got_ddrraddr),
 .got_ddrrdata(got_ddrrdata),
 .axi4mm_aw_rdy(axi4mm_aw_rdy),
 .axi4mm_aw_vld(axi4mm_aw_vld),
 .axi4mm_w_rdy(axi4mm_w_rdy),
 .axi4mm_w_vld(axi4mm_w_vld),
 .axi4mm_w_last(axi4mm_w_last),
 .axi4mm_b_rdy(axi4mm_b_rdy),
 .axi4mm_b_vld(axi4mm_b_vld),
 .axi4mm_ar_rdy(axi4mm_ar_rdy),
 .axi4mm_ar_vld(axi4mm_ar_vld),
 .axi4mm_r_rdy(axi4mm_r_rdy),
 .axi4mm_r_vld(axi4mm_r_vld),
 .axi4mm_r_last(axi4mm_r_last),
 .dram_test_enabled(dram_test_enabled),
 .nica_events(nica_events),
 .count_events(count_events),
 .clb0_events(clb0_events),
 .clb1_events(clb1_events),
 .clb0_out_on(clb0_out_on),
 .clb0_out_off(clb0_out_off),
 .clb1_out_on(clb1_out_on),
 .clb1_out_off(clb1_out_off),
 .clb2_events(clb2_events),
 .clb3_events(clb3_events),
 .clb2_out_on(clb2_out_on),
 .clb2_out_off(clb2_out_off),
 .clb3_out_on(clb3_out_on),
 .clb3_out_off(clb3_out_off),
 .stream0_match(stream0_match_event),
 .stream0_sample(stream0_sample_event),
 .stream0_merged(stream0_merged_event),
 .stream1_match(stream1_match_event),
 .stream1_sample(stream1_sample_event),
 .stream1_merged(stream1_merged_event),
 .stream2_match(stream2_match_event),
 .stream2_sample(stream2_sample_event),
 .stream2_merged(stream2_merged_event),
 .stream3_match(stream3_match_event),
 .stream3_sample(stream3_sample_event),
 .stream3_merged(stream3_merged_event),
 .stream0_sample_data(stream0_sample_data),
 .stream1_sample_data(stream1_sample_data),
 .stream2_sample_data(stream2_sample_data),
 .stream3_sample_data(stream3_sample_data),
				    
.monitor0_events_select(sigmon_ctrl2[15:0]),
.monitor1_events_select(sigmon_ctrl2[31:16]),
.monitor2_events_select(sigmon_ctrl3[15:0]),
.monitor3_events_select(sigmon_ctrl3[31:16]),
.monitor4_events_select(sigmon_ctrl4[15:0]),
.monitor5_events_select(sigmon_ctrl4[31:16]),
.monitor6_events_select(sigmon_ctrl5[15:0]),
.monitor7_events_select(sigmon_ctrl5[31:16]),
.monitors_fifo_rd(event_fifo_rd),
.monitor0_fifo_data(event0_fifo_data), 
.monitor1_fifo_data(event1_fifo_data), 
.monitor2_fifo_data(event2_fifo_data), 
.monitor3_fifo_data(event3_fifo_data), 
.monitor4_fifo_data(event4_fifo_data), 
.monitor5_fifo_data(event5_fifo_data), 
.monitor6_fifo_data(event6_fifo_data), 
.monitor7_fifo_data(event7_fifo_data), 
.monitor0_fifo_data_count(event0_fifo_data_count), 
.monitor1_fifo_data_count(event1_fifo_data_count), 
.monitor2_fifo_data_count(event2_fifo_data_count), 
.monitor3_fifo_data_count(event3_fifo_data_count), 
.monitor4_fifo_data_count(event4_fifo_data_count), 
.monitor5_fifo_data_count(event5_fifo_data_count), 
.monitor6_fifo_data_count(event6_fifo_data_count), 
.monitor7_fifo_data_count(event7_fifo_data_count), 
.monitors_valid(events_valid),
.monitors_data_loss(events_data_loss)
 );


////////////////////////////////////////////////////////////////////////
// Events timestamping counter is maintained withn each event_monx.
// Yet, the same timestamp counter is implemented here, for timestamp related events generation:

// Look for monitoring_enable assertion
always @(posedge clk) begin
  if (reset) begin
    monitoring_enable_asserted <= 0;
    monitoring_enable_assertedQ <= 0;
    timestamp_counter_enable <= 0;    
  end
  else begin
    monitoring_enable_assertedQ <= monitoring_enable;

// event_ctrl1[31] assertion is used to reset both time stamp counter and the event_fifo
    if (monitoring_enable & ~monitoring_enable_assertedQ)
      monitoring_enable_asserted <= 1;
    else 
      monitoring_enable_asserted <= 0;

// event_time_counter is enabled two clocks after event is enabled,
// and disabled once event_enable has been dropped
    if (monitoring_enable_asserted & monitoring_enable_assertedQ)
      timestamp_counter_enable <= 1;    
    if (~monitoring_enable & monitoring_enable_assertedQ)
      timestamp_counter_enable <= 0;    
  end
end

// Time stamp counter:
always @(posedge clk) begin
  if (reset | monitoring_enable_asserted) begin
    timestamp_counter <= 48'h000000000000;
    timestamp_counter_24toggle <= 0;
  end
  else begin
    if (timestamp_counter_enable) begin
      // What to do upon counter overflow...
      timestamp_counter <= timestamp_counter + 1;

// Look for timestamp_counter toggles at 24th bit position 
// Upon 24th bit toggled, event_time_counter[47:24] will be captured into sigmon_fifo
      if (timestamp_counter[23:0] == 24'hffffff) begin
	timestamp_counter_24toggle <= 1;
      end
    end
    if (timestamp_counter_24toggle)
      timestamp_counter_24toggle <= 0;
  end 
end  


////////////////////////////////////////////////////////////////////////
// Main sigmon fifo: 64k or 128k x 32bit 
//
`ifdef FIFO_128K

sigmon_fifo_128Kx32b fifo_128Kx32b (
  .clk(clk),                           // input wire clk
  .srst(sigmon_reset),                 // input wire srst
  .din(sigmon_fifo_din),               // input wire [31 : 0] din
  .wr_en(sigmon_fifo_wr),              // input wire wr_en
  .rd_en(sigmon_fifo_rd),              // input wire rd_en
  .dout(sigmon_fifo_dout),             // output wire [31 : 0] dout
  .full(sigmon_fifo_full),             // output wire full
  .almost_full(almost_full),           // output wire almost_full
  .wr_ack(wr_ack),                     // output wire wr_ack
  .overflow(sigmon_fifo_overflow),     // output wire overflow
  .empty(sigmon_fifo_empty),           // output wire empty
  .almost_empty(almost_empty),         // output wire almost_empty
  .valid(sigmon_fifo_valid),           // output wire valid
  .underflow(sigmon_fifo_underflow),   // output wire underflow
  .data_count(sigmon_fifo_data_count[17:0]), // output wire [17 : 0] data_count
  .wr_rst_busy(wr_rst_busy),           // output wire wr_rst_busy
  .rd_rst_busy(rd_rst_busy)            // output wire rd_rst_busy
);
  
`else

sigmon_fifo_64Kx32b fifo_64Kx32b (
  .clk(clk),                           // input wire clk
  .srst(sigmon_reset),                 // input wire srst
  .din(sigmon_fifo_din),               // input wire [31 : 0] din
  .wr_en(sigmon_fifo_wr),              // input wire wr_en
  .rd_en(sigmon_fifo_rd),              // input wire rd_en
  .dout(sigmon_fifo_dout),             // output wire [31 : 0] dout
  .full(sigmon_fifo_full),             // output wire full
  .almost_full(almost_full),           // output wire almost_full
  .wr_ack(wr_ack),                     // output wire wr_ack
  .overflow(sigmon_fifo_overflow),     // output wire overflow
  .empty(sigmon_fifo_empty),           // output wire empty
  .almost_empty(almost_empty),         // output wire almost_empty
  .valid(sigmon_fifo_valid),           // output wire valid
  .underflow(sigmon_fifo_underflow),   // output wire underflow
  .data_count(sigmon_fifo_data_count[16:0]), // output wire [16 : 0] data_count
  .wr_rst_busy(wr_rst_busy),           // output wire wr_rst_busy
  .rd_rst_busy(rd_rst_busy)            // output wire rd_rst_busy
);

`endif


///////////////////////////////////////////////////////////////////////////
// Events & trigger:
//
// An event is a function of other events and/or other samples signals.
// A trigger is a selected event, to control the sliding sampling window
// A sliding sampling window is supported, to allow positioning the trigger at any point along the sampling window depth
//
// Sliding sampling window examples:
// Example 1: Trigger is at middle of the sampling window
//            Useful to see the activity before and after the trigger
// Sampling window depth: 0, 1, 2, ..., 32k, ..., 64k
//                                      ^
//                                      |
//                                      trigger           
//
// Example2: Trigger at the end of the sampling window
//           Useful to capture the sequence of events that led to the trigger event
//  Sampling window depth: 0, 1, 2, ..., 32k, ..., 64k
//                                                 ^
//                                                 |
//                                                 trigger           
//
// The trigger position along the sampling window is controlled via sigmon_ctrl1
// Accepted values: 0..64k 

// Select the desired trigger source. It can be either of the sampled signals, or any of the programmed events
  reg sigmon_trigger;
  reg sigmon_trigger_en;

  always @(*) begin
    case (sigmon_ctrl1[23:16]) 
      NO_EVENT:
	// No trigger: Useful to sample the last N samples (in a test session) of the selected signals into sigmon_fifo:
	// Set trigger delay == N and restart the test session
	// During the test session, since the is no (and will not be) trigger, the sigmon_fifo will be continuously pre-empted, such that it will hold no more than N samples.
	begin
	  sigmon_trigger = 1'b0;
	  sigmon_trigger_en = 1'b0;
	end
      SBU2NWPFIFO_SOP:
	begin
	  sigmon_trigger = sbu2nwpfifo_sop;
	  sigmon_trigger_en = 1'b1;
	end
      SBU2NWPFIFO_EOP:
	begin
	  sigmon_trigger = sbu2nwpfifo_eop;
	  sigmon_trigger_en = 1'b1;
	end
      SBU2NWP_SOP:
	begin
	  sigmon_trigger = sbu2nwp_sop;
	  sigmon_trigger_en = 1'b1;
	end
      SBU2NWP_EOP:
	begin
	  sigmon_trigger = sbu2nwp_eop;
	  sigmon_trigger_en = 1'b1;
	end
      NWP2SBU_SOP:
	begin
	  sigmon_trigger = nwp2sbu_sop;
	  sigmon_trigger_en = 1'b1;
	end
      NWP2SBU_EOP:
	begin
	  sigmon_trigger = nwp2sbu_eop;
	  sigmon_trigger_en = 1'b1;
	end
      SBU2CXPFIFO_SOP:
	begin
	  sigmon_trigger = sbu2cxpfifo_sop;
	  sigmon_trigger_en = 1'b1;
	end
      SBU2CXPFIFO_EOP:
	begin
	  sigmon_trigger = sbu2cxpfifo_eop;
	  sigmon_trigger_en = 1'b1;
	end
      SBU2CXP_SOP:
	begin
	  sigmon_trigger = sbu2cxp_sop;
	  sigmon_trigger_en = 1'b1;
	end
      SBU2CXP_EOP:
	begin
	  sigmon_trigger = sbu2cxp_eop;
	  sigmon_trigger_en = 1'b1;
	end
      CXP2SBU_SOP:
	begin
	  sigmon_trigger = cxp2sbu_sop;
	  sigmon_trigger_en = 1'b1;
	end
      CXP2SBU_EOP:
	begin
	  sigmon_trigger = cxp2sbu_eop;
	  sigmon_trigger_en = 1'b1;
	end
      NWP2SBU_LOSSLESS_CREDITS_ON:
	begin
	  sigmon_trigger = nwp2sbu_lossless_credits_on;
	  sigmon_trigger_en = 1'b1;
	end
      NWP2SBU_LOSSLESS_CREDITS_OFF:
	begin
	  sigmon_trigger = nwp2sbu_lossless_credits_off;
	  sigmon_trigger_en = 1'b1;
	end
      CXP2SBU_LOSSLESS_CREDITS_ON:
	begin
	  sigmon_trigger = cxp2sbu_lossless_credits_on;
	  sigmon_trigger_en = 1'b1;
	end
      CXP2SBU_LOSSLESS_CREDITS_OFF:
	begin
	  sigmon_trigger = cxp2sbu_lossless_credits_off;
	  sigmon_trigger_en = 1'b1;
	end
      NICA_EVENT0:
	begin
	  sigmon_trigger = nica_events[0];
	  sigmon_trigger_en = 1'b1;
	end
      NICA_EVENT1:
	begin
	  sigmon_trigger = nica_events[1];
	  sigmon_trigger_en = 1'b1;
	end
      NICA_EVENT2:
	begin
	  sigmon_trigger = nica_events[2];
	  sigmon_trigger_en = 1'b1;
	end
      NICA_EVENT3:
	begin
	  sigmon_trigger = nica_events[3];
	  sigmon_trigger_en = 1'b1;
	end
      NICA_EVENT4:
	begin
	  sigmon_trigger = nica_events[4];
	  sigmon_trigger_en = 1'b1;
	end
      NICA_EVENT5:
	begin
	  sigmon_trigger = nica_events[5];
	  sigmon_trigger_en = 1'b1;
	end
      NICA_EVENT6:
	begin
	  sigmon_trigger = nica_events[6];
	  sigmon_trigger_en = 1'b1;
	end
      NICA_EVENT7:
	begin
	  sigmon_trigger = nica_events[7];
	  sigmon_trigger_en = 1'b1;
	end
      NICA_EVENT8:
	begin
	  sigmon_trigger = nica_events[8];
	  sigmon_trigger_en = 1'b1;
	end
      NICA_EVENT9:
	begin
	  sigmon_trigger = nica_events[9];
	  sigmon_trigger_en = 1'b1;
	end
      LOCAL_EVENT0:
	begin
	  sigmon_trigger = count_events[0];
	  sigmon_trigger_en = 1'b1;
	end
      LOCAL_EVENT1:
	begin
	  sigmon_trigger = count_events[1];
	  sigmon_trigger_en = 1'b1;
	end
      LOCAL_EVENT2:
	begin
	  sigmon_trigger = count_events[2];
	  sigmon_trigger_en = 1'b1;
	end
      LOCAL_EVENT3:
	begin
	  sigmon_trigger = count_events[3];
	  sigmon_trigger_en = 1'b1;
	end
      LOCAL_EVENT4:
	begin
	  sigmon_trigger = count_events[4];
	  sigmon_trigger_en = 1'b1;
	end
      LOCAL_EVENT5:
	begin
	  sigmon_trigger = count_events[5];
	  sigmon_trigger_en = 1'b1;
	end
      LOCAL_EVENT6:
	begin
	  sigmon_trigger = count_events[6];
	  sigmon_trigger_en = 1'b1;
	end
      LOCAL_EVENT7:
	begin
	  sigmon_trigger = count_events[7];
	  sigmon_trigger_en = 1'b1;
	end
      LOCAL_EVENT8:
	begin
	  sigmon_trigger = count_events[8];
	  sigmon_trigger_en = 1'b1;
	end
      LOCAL_EVENT9:
	begin
	  sigmon_trigger = count_events[9];
	  sigmon_trigger_en = 1'b1;
	end
      LOCAL_EVENT10:
	begin
	  sigmon_trigger = count_events[10];
	  sigmon_trigger_en = 1'b1;
	end
      LOCAL_EVENT11:
	begin
	  sigmon_trigger = count_events[11];
	  sigmon_trigger_en = 1'b1;
	end
      DRAM_IK_WADDR:
	begin
	  sigmon_trigger = got_ikwaddr;
	  sigmon_trigger_en = 1'b1;
	end
      DRAM_IK_RADDR:
	begin
	  sigmon_trigger = got_ikraddr;
	  sigmon_trigger_en = 1'b1;
	end
      DRAM_WADDR:
	begin
	  sigmon_trigger = got_ddrwaddr;
	  sigmon_trigger_en = 1'b1;
	end
      DRAM_WDATA:
	begin
	  sigmon_trigger = got_ddrwdata;
	  sigmon_trigger_en = 1'b1;
	end
      DRAM_WDONE:
	begin
	  sigmon_trigger = got_ddrwdone;
	  sigmon_trigger_en = 1'b1;
	end
      DRAM_RADDR:
	begin
	  sigmon_trigger = got_ddrraddr;
	  sigmon_trigger_en = 1'b1;
	end
      DRAM_RDATA:
	begin
	  sigmon_trigger = got_ddrrdata;
	  sigmon_trigger_en = 1'b1;
	end
      DRAM_TEST_ENABLE:
	begin
	  sigmon_trigger = dram_test_enabled;
	  sigmon_trigger_en = 1'b1;
	end
      CLB0_START:
	begin
	  sigmon_trigger = clb0_events[0];
	  sigmon_trigger_en = 1'b1;
	end
      CLB0_MID:
	begin
	  sigmon_trigger = clb0_events[1];
	  sigmon_trigger_en = 1'b1;
	end
      CLB0_END:
	begin
	  sigmon_trigger = clb0_events[2];
	  sigmon_trigger_en = 1'b1;
	end
      CLB0_OUT_ON:
	begin
	  sigmon_trigger = clb0_out_on;
	  sigmon_trigger_en = 1'b1;
	end
      CLB0_OUT_OFF:
	begin
	  sigmon_trigger = clb0_out_off;
	  sigmon_trigger_en = 1'b1;
	end
      CLB1_START:
	begin
	  sigmon_trigger = clb1_events[0];
	  sigmon_trigger_en = 1'b1;
	end
      CLB1_MID:
	begin
	  sigmon_trigger = clb1_events[1];
	  sigmon_trigger_en = 1'b1;
	end
      CLB1_END:
	begin
	  sigmon_trigger = clb1_events[2];
	  sigmon_trigger_en = 1'b1;
	end
      CLB1_OUT_ON:
	begin
	  sigmon_trigger = clb1_out_on;
	  sigmon_trigger_en = 1'b1;
	end
      CLB1_OUT_OFF:
	begin
	  sigmon_trigger = clb1_out_off;
	  sigmon_trigger_en = 1'b1;
	end
      CLB2_START:
	begin
	  sigmon_trigger = clb2_events[0];
	  sigmon_trigger_en = 1'b1;
	end
      CLB2_MID:
	begin
	  sigmon_trigger = clb2_events[1];
	  sigmon_trigger_en = 1'b1;
	end
      CLB2_END:
	begin
	  sigmon_trigger = clb2_events[2];
	  sigmon_trigger_en = 1'b1;
	end
      CLB2_OUT_ON:
	begin
	  sigmon_trigger = clb2_out_on;
	  sigmon_trigger_en = 1'b1;
	end
      CLB2_OUT_OFF:
	begin
	  sigmon_trigger = clb2_out_off;
	  sigmon_trigger_en = 1'b1;
	end
      CLB3_START:
	begin
	  sigmon_trigger = clb3_events[0];
	  sigmon_trigger_en = 1'b1;
	end
      CLB3_MID:
	begin
	  sigmon_trigger = clb3_events[1];
	  sigmon_trigger_en = 1'b1;
	end
      CLB3_END:
	begin
	  sigmon_trigger = clb3_events[2];
	  sigmon_trigger_en = 1'b1;
	end
      CLB3_OUT_ON:
	begin
	  sigmon_trigger = clb3_out_on;
	  sigmon_trigger_en = 1'b1;
	end
      CLB3_OUT_OFF:
	begin
	  sigmon_trigger = clb3_out_off;
	  sigmon_trigger_en = 1'b1;
	end
      STREAM0_PATTERN_MATCH:
	begin
	  sigmon_trigger = stream0_match_event;
	  sigmon_trigger_en = 1'b1;
	end
      STREAM0_PATTERN_SAMPLE:
	begin
	  sigmon_trigger = stream0_sample_event;
	  sigmon_trigger_en = 1'b1;
	end
      STREAM1_PATTERN_MATCH:
	begin
	  sigmon_trigger = stream1_match_event;
	  sigmon_trigger_en = 1'b1;
	end
      STREAM1_PATTERN_SAMPLE:
	begin
	  sigmon_trigger = stream1_sample_event;
	  sigmon_trigger_en = 1'b1;
	end
      STREAM2_PATTERN_MATCH:
	begin
	  sigmon_trigger = stream2_match_event;
	  sigmon_trigger_en = 1'b1;
	end
      STREAM2_PATTERN_SAMPLE:
	begin
	  sigmon_trigger = stream2_sample_event;
	  sigmon_trigger_en = 1'b1;
	end
      STREAM3_PATTERN_MATCH:
	begin
	  sigmon_trigger = stream3_match_event;
	  sigmon_trigger_en = 1'b1;
	end
      STREAM3_PATTERN_SAMPLE:
	begin
	  sigmon_trigger = stream3_sample_event;
	  sigmon_trigger_en = 1'b1;
	end
      STREAM0_PATTERN_MERGED:
	begin
	  sigmon_trigger = stream0_merged_event;
	  sigmon_trigger_en = 1'b1;
	end
      STREAM1_PATTERN_MERGED:
	begin
	  sigmon_trigger = stream1_merged_event;
	  sigmon_trigger_en = 1'b1;
	end
      STREAM2_PATTERN_MERGED:
	begin
	  sigmon_trigger = stream2_merged_event;
	  sigmon_trigger_en = 1'b1;
	end
      STREAM3_PATTERN_MERGED:
	begin
	  sigmon_trigger = stream3_merged_event;
	  sigmon_trigger_en = 1'b1;
	end
      SIGMON_ENABLED:
	begin
	  sigmon_trigger = sigmon_enable_event;
	  sigmon_trigger_en = 1'b1;
	end

      default: begin
	sigmon_trigger = sigmon_enable_event;
	sigmon_trigger_en = 1'b1;
      end
    endcase
  end // always @ begin

  
// sigmon_fifo_drop is used to drop entries from sigmon fifo, while waiting for the trigger
  assign sigmon_fifo_rd = sigmon_fifo_rd2axi | sigmon_fifo_drop;
  
  always @(posedge clk) begin
    if (reset) begin
      sigmon_fifo_drop <= 1'b0;
      trigger_occurred <= 1'b0;
    end
    else begin
      if (sigmon_ctrl1[31]) begin
	if (sigmon_trigger & sigmon_trigger_en)
	  // Will be cleared only at monitoring restart
	  trigger_occurred <= 1'b1;
	
`ifdef FIFO_128K
	if  (~trigger_occurred & (sigmon_fifo_data_count[16:0] > {sigmon_ctrl1[11:0], 5'b00000}))
`else
	if  (~trigger_occurred & (sigmon_fifo_data_count[15:0] > {sigmon_ctrl1[10:0], 5'b00000}))
`endif
	    // As long as trigger not occurred, keep dropping the fifo, to match the requested trigger position
	    sigmon_fifo_drop <= 1'b1;
	  else
	    sigmon_fifo_drop <= 1'b0;	
      end
      else 
	trigger_occurred <= 1'b0;
    end
  end


//////////////////////////////////////////////////////////////////////////////////////////////////////
// Counters & count related events
//
  sigmon_counters  sigmon_counters
(
 .clk(clk),
 .reset(reset),
 .counters_enable(sigmon_ctrl1[31]),
 .sigmon_enable_event(sigmon_enable_event),
 .timestamp_counter_24toggle(timestamp_counter_24toggle),
 .nwp2sbu_sop(nwp2sbu_sop),
 .nwp2sbu_eop(nwp2sbu_eop),
 .nwp2sbu_eop_temp(nwp2sbu_eop_temp),
 .sbu2nwp_sop(sbu2nwp_sop),
 .sbu2nwp_eop(sbu2nwp_eop),
 .cxp2sbu_sop(cxp2sbu_sop),
 .cxp2sbu_eop(cxp2sbu_eop),
 .sbu2cxp_sop(sbu2cxp_sop),
 .sbu2cxp_eop(sbu2cxp_eop),
 .sbu2cxpfifo_sop(sbu2cxpfifo_sop),
 .sbu2cxpfifo_eop(sbu2cxpfifo_eop),
 .sbu2nwpfifo_sop(sbu2nwpfifo_sop),
 .sbu2nwpfifo_eop(sbu2nwpfifo_eop),
 .nwp2sbu_lossless_credits_on(nwp2sbu_lossless_credits_on),
 .cxp2sbu_lossless_credits_on(cxp2sbu_lossless_credits_on),
 .nwp2sbu_lossless_credits_off(nwp2sbu_lossless_credits_off),
 .cxp2sbu_lossless_credits_off(cxp2sbu_lossless_credits_off),
 .got_ikwaddr(got_ikwaddr),
 .got_ikraddr(got_ikraddr),
 .got_ddrwaddr(got_ddrwaddr),
 .got_ddrwdata(got_ddrwdata),
 .got_ddrwdone(got_ddrwdone),
 .got_ddrraddr(got_ddrraddr),
 .got_ddrrdata(got_ddrrdata),
 .dram_test_enabled(dram_test_enabled),
 .nica_events(nica_events),
 .clb0_out(clb0_outQ),
 .clb1_out(clb1_outQ),
 .clb2_out(clb2_outQ),
 .clb3_out(clb3_outQ),
 .clb0_events(clb0_events),
 .clb1_events(clb1_events),
 .clb2_events(clb2_events),
 .clb3_events(clb3_events),
 .clb0_out_on(clb0_out_on),
 .clb0_out_off(clb0_out_off),
 .clb1_out_on(clb1_out_on),
 .clb1_out_off(clb1_out_off),
 .clb2_out_on(clb2_out_on),
 .clb2_out_off(clb2_out_off),
 .clb3_out_on(clb3_out_on),
 .clb3_out_off(clb3_out_off),
 .stream0_match(stream0_match_event),
 .stream0_sample(stream0_sample_event),
 .stream0_merged(stream0_merged_event),
 .stream1_match(stream1_match_event),
 .stream1_sample(stream1_sample_event),
 .stream1_merged(stream1_merged_event),
 .stream2_match(stream2_match_event),
 .stream2_sample(stream2_sample_event),
 .stream2_merged(stream2_merged_event),
 .stream3_match(stream3_match_event),
 .stream3_sample(stream3_sample_event),
 .stream3_merged(stream3_merged_event),
 .events0_select(sigmon_ctrl100),
 .count0_limit(sigmon_ctrl104),
 .events1_select(sigmon_ctrl110),
 .count1_limit(sigmon_ctrl114),
 .events2_select(sigmon_ctrl120),
 .count2_limit(sigmon_ctrl124),
 .events3_select(sigmon_ctrl130),
 .count3_limit(sigmon_ctrl134),
 .events4_select(sigmon_ctrl140),
 .count4_limit(sigmon_ctrl144),
 .events5_select(sigmon_ctrl150),
 .count5_limit(sigmon_ctrl154),
 .events6_select(sigmon_ctrl160),
 .count6_limit(sigmon_ctrl164),
 .events7_select(sigmon_ctrl170),
 .count7_limit(sigmon_ctrl174),
 .events8_select(sigmon_ctrl180),
 .count8_limit(sigmon_ctrl184),
 .events9_select(sigmon_ctrl190),
 .count9_limit(sigmon_ctrl194),
 .events10_select(sigmon_ctrl1a0),
 .count10_limit(sigmon_ctrl1a4),
 .events11_select(sigmon_ctrl1b0),
 .count11_limit(sigmon_ctrl1b4),
 .count0_out(count0_data), 
 .count1_out(count1_data), 
 .count2_out(count2_data), 
 .count3_out(count3_data), 
 .count4_out(count4_data), 
 .count5_out(count5_data), 
 .count6_out(count6_data), 
 .count7_out(count7_data), 
 .count8_out(count8_data), 
 .count9_out(count9_data), 
 .count10_out(count10_data), 
 .count11_out(count11_data), 
 .events_out(count_events)
 );

  
////////////////////////////////////////////////////////////////////////////
// Configurable Logic Blocks
//  
//
// TBD: Review the need for this status reg
//  assign sigmon_clbs_status[3:0] = clb0_in;
//  assign sigmon_clbs_status[6:4] = 3'b000; // reserved
//  assign sigmon_clbs_status[7] = clb0_out;
//  assign sigmon_clbs_status[11:8] = clb1_in;
//  assign sigmon_clbs_status[14:12] = 3'b000; // reserved
//  assign sigmon_clbs_status[15] = clb1_out;
//  assign sigmon_clbs_status[31:16] = 16'h0000; // reserved
  assign sigmon_clbs_status[31:0] = 32'h00000000;
  
  always @(posedge clk) begin
    if (reset) begin
      clb0_outQ <= 1'b0;
      clb0_out_on <= 1'b0;
      clb0_out_off <= 1'b0;
      clb1_outQ <= 1'b0;
      clb1_out_on <= 1'b0;
      clb1_out_off <= 1'b0;
      clb2_outQ <= 1'b0;
      clb2_out_on <= 1'b0;
      clb2_out_off <= 1'b0;
      clb3_outQ <= 1'b0;
      clb3_out_on <= 1'b0;
      clb3_out_off <= 1'b0;
    end

    else begin
      clb0_outQ <= clb0_out;
      clb1_outQ <= clb1_out;
      clb2_outQ <= clb2_out;
      clb3_outQ <= clb3_out;
      
      if (~clb0_outQ & clb0_out)
	clb0_out_on <= 1'b1;
      else 
	clb0_out_on <= 1'b0;
      
      if (clb0_outQ & ~clb0_out)
	clb0_out_off <= 1'b1;
      else 
	clb0_out_off <= 1'b0;


      if (~clb1_outQ & clb1_out)
	clb1_out_on <= 1'b1;
      else 
	clb1_out_on <= 1'b0;
      
      if (clb1_outQ & ~clb1_out)
	clb1_out_off <= 1'b1;
      else 
	clb1_out_off <= 1'b0;


      if (~clb2_outQ & clb2_out)
	clb2_out_on <= 1'b1;
      else 
	clb2_out_on <= 1'b0;
      
      if (clb2_outQ & ~clb2_out)
	clb2_out_off <= 1'b1;
      else 
	clb2_out_off <= 1'b0;


      if (~clb3_outQ & clb3_out)
	clb3_out_on <= 1'b1;
      else 
	clb3_out_on <= 1'b0;
      
      if (clb3_outQ & ~clb3_out)
	clb3_out_off <= 1'b1;
      else 
	clb3_out_off <= 1'b0;

    end
  end
  
sigmon_logic_blocks sigmon_clbs (
.clk(clk),
.reset(reset),
.clbs_enable(sigmon_ctrl1[31]),
.clb0_in_select(sigmon_ctrl10[31:0]),
.clb0_start_limit(sigmon_ctrl11[31:0]),
.clb0_mid_limit(sigmon_ctrl12[31:0]),
.clb1_in_select(sigmon_ctrl13[31:0]),
.clb1_start_limit(sigmon_ctrl14[31:0]),
.clb1_mid_limit(sigmon_ctrl15[31:0]),
.clb2_in_select(sigmon_ctrl16[31:0]),
.clb2_start_limit(sigmon_ctrl17[31:0]),
.clb2_mid_limit(sigmon_ctrl18[31:0]),
.clb3_in_select(sigmon_ctrl19[31:0]),
.clb3_start_limit(sigmon_ctrl20[31:0]),
.clb3_mid_limit(sigmon_ctrl21[31:0]),
.clbs_logic_eq(sigmon_ctrl22[31:0]),
.sbu2nwp_rdy(sbu2nwp_rdy),
.sbu2nwp_vld(sbu2nwp_vld),
.nwp2sbu_rdy(nwp2sbu_rdy),
.nwp2sbu_vld(nwp2sbu_vld),
.sbu2cxp_rdy(sbu2cxp_rdy),
.sbu2cxp_vld(sbu2cxp_vld),
.cxp2sbu_rdy(cxp2sbu_rdy),
.cxp2sbu_vld(cxp2sbu_vld),
.sbu2nwp_tlast(sbu2nwp_tlast),
.nwp2sbu_tlast(nwp2sbu_tlast),
.sbu2cxp_tlast(sbu2cxp_tlast),
.cxp2sbu_tlast(cxp2sbu_tlast),
.nwp2sbu_lossless_credits(nwp2sbu_lossless_credits),
.cxp2sbu_lossless_credits(cxp2sbu_lossless_credits),
.axi4mm_aw_rdy(axi4mm_aw_rdy),
.axi4mm_aw_vld(axi4mm_aw_vld),
.axi4mm_w_rdy(axi4mm_w_rdy),
.axi4mm_w_vld(axi4mm_w_vld),
.axi4mm_w_last(axi4mm_w_last),
.axi4mm_b_rdy(axi4mm_b_rdy),
.axi4mm_b_vld(axi4mm_b_vld),
.axi4mm_ar_rdy(axi4mm_ar_rdy),
.axi4mm_ar_vld(axi4mm_ar_vld),
.axi4mm_r_rdy(axi4mm_r_rdy),
.axi4mm_r_vld(axi4mm_r_vld),
.axi4mm_r_last(axi4mm_r_last),
.sigmon_enable_event(sigmon_enable_event),
.nica_events(nica_events),

.clbs_out({clb3_out, clb2_out, clb1_out, clb0_out}),
.clb0_events_out(clb0_events),
.clb1_events_out(clb1_events),
.clb2_events_out(clb2_events),
.clb3_events_out(clb3_events)
 );

////////////////////////////////////////////////////////////////////////////
// axi4stream pattern matching & sampling
//
  always @(*) begin
    // stream0_pattern enable selector:
    case (sigmon_stream0_pattern_ctrl2[7:0]) 
      NO_EVENT:
	begin
	  stream0_pattern_enable = 1'b0;
	end
      EVENT_TRUE:
	begin
	  stream0_pattern_enable = 1'b1;
	end
      TIMESTAMP_24TOGGLE:
	begin
	  stream0_pattern_enable = timestamp_counter_24toggle;
	end
      EVENT_FALSE:
	begin
	  stream0_pattern_enable = 1'b0;
	end
      SBU2NWPFIFO_SOP:
	begin
	  stream0_pattern_enable = sbu2nwpfifo_sop;
	end
      SBU2NWPFIFO_EOP:
	begin
	  stream0_pattern_enable = sbu2nwpfifo_eop;
	end
      SBU2NWP_SOP:
	begin
	  stream0_pattern_enable = sbu2nwp_sop;
	end
      SBU2NWP_EOP:
	begin
	  stream0_pattern_enable = sbu2nwp_eop;
	end
      NWP2SBU_SOP:
	begin
	  stream0_pattern_enable = nwp2sbu_sop;
	end
      NWP2SBU_EOP:
	begin
	  stream0_pattern_enable = nwp2sbu_eop;
	end
      SBU2CXPFIFO_SOP:
	begin
	  stream0_pattern_enable = sbu2cxpfifo_sop;
	end
      SBU2CXPFIFO_EOP:
	begin
	  stream0_pattern_enable = sbu2cxpfifo_eop;
	end
      SBU2CXP_SOP:
	begin
	  stream0_pattern_enable = sbu2cxp_sop;
	end
      SBU2CXP_EOP:
	begin
	  stream0_pattern_enable = sbu2cxp_eop;
	end
      CXP2SBU_SOP:
	begin
	  stream0_pattern_enable = cxp2sbu_sop;
	end
      CXP2SBU_EOP:
	begin
	  stream0_pattern_enable = cxp2sbu_eop;
	end
      NWP2SBU_LOSSLESS_CREDITS_ON:
	begin
	  stream0_pattern_enable = nwp2sbu_lossless_credits_on;
	end
      NWP2SBU_LOSSLESS_CREDITS_OFF:
	begin
	  stream0_pattern_enable = nwp2sbu_lossless_credits_off;
	end
      CXP2SBU_LOSSLESS_CREDITS_ON:
	begin
	  stream0_pattern_enable = cxp2sbu_lossless_credits_on;
	end
      CXP2SBU_LOSSLESS_CREDITS_OFF:
	begin
	  stream0_pattern_enable = cxp2sbu_lossless_credits_off;
	end
      NICA_EVENT0:
	begin
	  stream0_pattern_enable = nica_events[0];
	end
      NICA_EVENT1:
	begin
	  stream0_pattern_enable = nica_events[1];
	end
      NICA_EVENT2:
	begin
	  stream0_pattern_enable = nica_events[2];
	end
      NICA_EVENT3:
	begin
	  stream0_pattern_enable = nica_events[3];
	end
      NICA_EVENT4:
	begin
	  stream0_pattern_enable = nica_events[4];
	end
      NICA_EVENT5:
	begin
	  stream0_pattern_enable = nica_events[5];
	end
      NICA_EVENT6:
	begin
	  stream0_pattern_enable = nica_events[6];
	end
      NICA_EVENT7:
	begin
	  stream0_pattern_enable = nica_events[7];
	end
      NICA_EVENT8:
	begin
	  stream0_pattern_enable = nica_events[8];
	end
      NICA_EVENT9:
	begin
	  stream0_pattern_enable = nica_events[9];
	end
      LOCAL_EVENT0:
	begin
	  stream0_pattern_enable = count_events[0];
	end
      LOCAL_EVENT1:
	begin
	  stream0_pattern_enable = count_events[1];
	end
      LOCAL_EVENT2:
	begin
	  stream0_pattern_enable = count_events[2];
	end
      LOCAL_EVENT3:
	begin
	  stream0_pattern_enable = count_events[3];
	end
      LOCAL_EVENT4:
	begin
	  stream0_pattern_enable = count_events[4];
	end
      LOCAL_EVENT5:
	begin
	  stream0_pattern_enable = count_events[5];
	end
      LOCAL_EVENT6:
	begin
	  stream0_pattern_enable = count_events[6];
	end
      LOCAL_EVENT7:
	begin
	  stream0_pattern_enable = count_events[7];
	end
      LOCAL_EVENT8:
	begin
	  stream0_pattern_enable = count_events[8];
	end
      LOCAL_EVENT9:
	begin
	  stream0_pattern_enable = count_events[9];
	end
      LOCAL_EVENT10:
	begin
	  stream0_pattern_enable = count_events[10];
	end
      LOCAL_EVENT11:
	begin
	  stream0_pattern_enable = count_events[11];
	end
      DRAM_IK_WADDR:
	begin
	  stream0_pattern_enable = got_ikwaddr;
	end
      DRAM_IK_RADDR:
	begin
	  stream0_pattern_enable = got_ikraddr;
	end
      DRAM_WADDR:
	begin
	  stream0_pattern_enable = got_ddrwaddr;
	end
      DRAM_WDATA:
	begin
	  stream0_pattern_enable = got_ddrwdata;
	end
      DRAM_WDONE:
	begin
	  stream0_pattern_enable = got_ddrwdone;
	end
      DRAM_RADDR:
	begin
	  stream0_pattern_enable = got_ddrraddr;
	end
      DRAM_RDATA:
	begin
	  stream0_pattern_enable = got_ddrrdata;
	end
      DRAM_TEST_ENABLE:
	begin
	  stream0_pattern_enable = dram_test_enabled;
	end
      CLB0_START:
	begin
	  stream0_pattern_enable = clb0_events[0];
	end
      CLB0_MID:
	begin
	  stream0_pattern_enable = clb0_events[1];
	end
      CLB0_END:
	begin
	  stream0_pattern_enable = clb0_events[2];
	end
      CLB0_OUT_ON:
	begin
	  stream0_pattern_enable = clb0_out_on;
	end
      CLB0_OUT_OFF:
	begin
	  stream0_pattern_enable = clb0_out_off;
	end
      CLB1_START:
	begin
	  stream0_pattern_enable = clb1_events[0];
	end
      CLB1_MID:
	begin
	  stream0_pattern_enable = clb1_events[1];
	end
      CLB1_END:
	begin
	  stream0_pattern_enable = clb1_events[2];
	end
      CLB1_OUT_ON:
	begin
	  stream0_pattern_enable = clb1_out_on;
	end
      CLB1_OUT_OFF:
	begin
	  stream0_pattern_enable = clb1_out_off;
	end
      CLB2_START:
	begin
	  stream0_pattern_enable = clb2_events[0];
	end
      CLB2_MID:
	begin
	  stream0_pattern_enable = clb2_events[1];
	end
      CLB2_END:
	begin
	  stream0_pattern_enable = clb2_events[2];
	end
      CLB2_OUT_ON:
	begin
	  stream0_pattern_enable = clb2_out_on;
	end
      CLB2_OUT_OFF:
	begin
	  stream0_pattern_enable = clb2_out_off;
	end
      CLB3_START:
	begin
	  stream0_pattern_enable = clb3_events[0];
	end
      CLB3_MID:
	begin
	  stream0_pattern_enable = clb3_events[1];
	end
      CLB3_END:
	begin
	  stream0_pattern_enable = clb3_events[2];
	end
      CLB3_OUT_ON:
	begin
	  stream0_pattern_enable = clb3_out_on;
	end
      CLB3_OUT_OFF:
	begin
	  stream0_pattern_enable = clb3_out_off;
	end
// Aviod loop back
//      STREAM0_PATTERN_MATCH:
//	begin
//	  stream0_pattern_enable = stream0_match_event;
//	end
//    STREAM0_PATTERN_SAMPLE:
//	begin
//	  stream0_pattern_enable = stream0_sample_event;
//	end
//      STREAM0_PATTERN_MERGED:
//	begin
//	  stream0_pattern_enable = stream0_merged_event;
//	end
      STREAM1_PATTERN_MATCH:
	begin
	  stream0_pattern_enable = stream1_match_event;
	end
      STREAM1_PATTERN_SAMPLE:
	begin
	  stream0_pattern_enable = stream1_sample_event;
	end
      STREAM1_PATTERN_MERGED:
	begin
	  stream0_pattern_enable = stream1_merged_event;
	end
      STREAM2_PATTERN_MATCH:
	begin
	  stream0_pattern_enable = stream2_match_event;
	end
      STREAM2_PATTERN_SAMPLE:
	begin
	  stream0_pattern_enable = stream2_sample_event;
	end
      STREAM2_PATTERN_MERGED:
	begin
	  stream0_pattern_enable = stream2_merged_event;
	end
      STREAM3_PATTERN_MATCH:
	begin
	  stream0_pattern_enable = stream3_match_event;
	end
      STREAM3_PATTERN_SAMPLE:
	begin
	  stream0_pattern_enable = stream3_sample_event;
	end
      STREAM3_PATTERN_MERGED:
	begin
	  stream0_pattern_enable = stream3_merged_event;
	end
      SIGMON_ENABLED:
	begin
	  stream0_pattern_enable = sigmon_enable_event;
	end
      default: begin
	stream0_pattern_enable = 1'b0;
      end
    endcase

    // stream0_pattern disable selector:
    case (sigmon_stream0_pattern_ctrl2[15:8]) 
      NO_EVENT:
	begin
	  stream0_pattern_disable = 1'b0;
	end
      EVENT_TRUE:
	begin
	  stream0_pattern_disable = 1'b1;
	end
      TIMESTAMP_24TOGGLE:
	begin
	  stream0_pattern_disable = timestamp_counter_24toggle;
	end
      EVENT_FALSE:
	begin
	  stream0_pattern_disable = 1'b0;
	end
      SBU2NWPFIFO_SOP:
	begin
	  stream0_pattern_disable = sbu2nwpfifo_sop;
	end
      SBU2NWPFIFO_EOP:
	begin
	  stream0_pattern_disable = sbu2nwpfifo_eop;
	end
      SBU2NWP_SOP:
	begin
	  stream0_pattern_disable = sbu2nwp_sop;
	end
      SBU2NWP_EOP:
	begin
	  stream0_pattern_disable = sbu2nwp_eop;
	end
      NWP2SBU_SOP:
	begin
	  stream0_pattern_disable = nwp2sbu_sop;
	end
      NWP2SBU_EOP:
	begin
	  stream0_pattern_disable = nwp2sbu_eop;
	end
      SBU2CXPFIFO_SOP:
	begin
	  stream0_pattern_disable = sbu2cxpfifo_sop;
	end
      SBU2CXPFIFO_EOP:
	begin
	  stream0_pattern_disable = sbu2cxpfifo_eop;
	end
      SBU2CXP_SOP:
	begin
	  stream0_pattern_disable = sbu2cxp_sop;
	end
      SBU2CXP_EOP:
	begin
	  stream0_pattern_disable = sbu2cxp_eop;
	end
      CXP2SBU_SOP:
	begin
	  stream0_pattern_disable = cxp2sbu_sop;
	end
      CXP2SBU_EOP:
	begin
	  stream0_pattern_disable = cxp2sbu_eop;
	end
      NWP2SBU_LOSSLESS_CREDITS_ON:
	begin
	  stream0_pattern_disable = nwp2sbu_lossless_credits_on;
	end
      NWP2SBU_LOSSLESS_CREDITS_OFF:
	begin
	  stream0_pattern_disable = nwp2sbu_lossless_credits_off;
	end
      CXP2SBU_LOSSLESS_CREDITS_ON:
	begin
	  stream0_pattern_disable = cxp2sbu_lossless_credits_on;
	end
      CXP2SBU_LOSSLESS_CREDITS_OFF:
	begin
	  stream0_pattern_disable = cxp2sbu_lossless_credits_off;
	end
      NICA_EVENT0:
	begin
	  stream0_pattern_disable = nica_events[0];
	end
      NICA_EVENT1:
	begin
	  stream0_pattern_disable = nica_events[1];
	end
      NICA_EVENT2:
	begin
	  stream0_pattern_disable = nica_events[2];
	end
      NICA_EVENT3:
	begin
	  stream0_pattern_disable = nica_events[3];
	end
      NICA_EVENT4:
	begin
	  stream0_pattern_disable = nica_events[4];
	end
      NICA_EVENT5:
	begin
	  stream0_pattern_disable = nica_events[5];
	end
      NICA_EVENT6:
	begin
	  stream0_pattern_disable = nica_events[6];
	end
      NICA_EVENT7:
	begin
	  stream0_pattern_disable = nica_events[7];
	end
      NICA_EVENT8:
	begin
	  stream0_pattern_disable = nica_events[8];
	end
      NICA_EVENT9:
	begin
	  stream0_pattern_disable = nica_events[9];
	end
      LOCAL_EVENT0:
	begin
	  stream0_pattern_disable = count_events[0];
	end
      LOCAL_EVENT1:
	begin
	  stream0_pattern_disable = count_events[1];
	end
      LOCAL_EVENT2:
	begin
	  stream0_pattern_disable = count_events[2];
	end
      LOCAL_EVENT3:
	begin
	  stream0_pattern_disable = count_events[3];
	end
      LOCAL_EVENT4:
	begin
	  stream0_pattern_disable = count_events[4];
	end
      LOCAL_EVENT5:
	begin
	  stream0_pattern_disable = count_events[5];
	end
      LOCAL_EVENT6:
	begin
	  stream0_pattern_disable = count_events[6];
	end
      LOCAL_EVENT7:
	begin
	  stream0_pattern_disable = count_events[7];
	end
      LOCAL_EVENT8:
	begin
	  stream0_pattern_disable = count_events[8];
	end
      LOCAL_EVENT9:
	begin
	  stream0_pattern_disable = count_events[9];
	end
      LOCAL_EVENT10:
	begin
	  stream0_pattern_disable = count_events[10];
	end
      LOCAL_EVENT11:
	begin
	  stream0_pattern_disable = count_events[11];
	end
      DRAM_IK_WADDR:
	begin
	  stream0_pattern_disable = got_ikwaddr;
	end
      DRAM_IK_RADDR:
	begin
	  stream0_pattern_disable = got_ikraddr;
	end
      DRAM_WADDR:
	begin
	  stream0_pattern_disable = got_ddrwaddr;
	end
      DRAM_WDATA:
	begin
	  stream0_pattern_disable = got_ddrwdata;
	end
      DRAM_WDONE:
	begin
	  stream0_pattern_disable = got_ddrwdone;
	end
      DRAM_RADDR:
	begin
	  stream0_pattern_disable = got_ddrraddr;
	end
      DRAM_RDATA:
	begin
	  stream0_pattern_disable = got_ddrrdata;
	end
      DRAM_TEST_ENABLE:
	begin
	  stream0_pattern_disable = dram_test_enabled;
	end
      CLB0_START:
	begin
	  stream0_pattern_disable = clb0_events[0];
	end
      CLB0_MID:
	begin
	  stream0_pattern_disable = clb0_events[1];
	end
      CLB0_END:
	begin
	  stream0_pattern_disable = clb0_events[2];
	end
      CLB0_OUT_ON:
	begin
	  stream0_pattern_disable = clb0_out_on;
	end
      CLB0_OUT_OFF:
	begin
	  stream0_pattern_disable = clb0_out_off;
	end
      CLB1_START:
	begin
	  stream0_pattern_disable = clb1_events[0];
	end
      CLB1_MID:
	begin
	  stream0_pattern_disable = clb1_events[1];
	end
      CLB1_END:
	begin
	  stream0_pattern_disable = clb1_events[2];
	end
      CLB1_OUT_ON:
	begin
	  stream0_pattern_disable = clb1_out_on;
	end
      CLB1_OUT_OFF:
	begin
	  stream0_pattern_disable = clb1_out_off;
	end
      CLB2_START:
	begin
	  stream0_pattern_disable = clb2_events[0];
	end
      CLB2_MID:
	begin
	  stream0_pattern_disable = clb2_events[1];
	end
      CLB2_END:
	begin
	  stream0_pattern_disable = clb2_events[2];
	end
      CLB2_OUT_ON:
	begin
	  stream0_pattern_disable = clb2_out_on;
	end
      CLB2_OUT_OFF:
	begin
	  stream0_pattern_disable = clb2_out_off;
	end
      CLB3_START:
	begin
	  stream0_pattern_disable = clb3_events[0];
	end
      CLB3_MID:
	begin
	  stream0_pattern_disable = clb3_events[1];
	end
      CLB3_END:
	begin
	  stream0_pattern_disable = clb3_events[2];
	end
      CLB3_OUT_ON:
	begin
	  stream0_pattern_disable = clb3_out_on;
	end
      CLB3_OUT_OFF:
	begin
	  stream0_pattern_disable = clb3_out_off;
	end

// Loop back: Use its own output event, to disable further pattern matching/sampling
// Useful to match/sample the first occurring match/sample only.
      STREAM0_PATTERN_MATCH:
	begin
	  stream0_pattern_disable = stream0_match_event;
	end
      STREAM0_PATTERN_SAMPLE:
	begin
	  stream0_pattern_disable = stream0_sample_event;
	end
      STREAM0_PATTERN_MERGED:
	begin
	  stream0_pattern_disable = stream0_merged_event;
	end
      STREAM1_PATTERN_MATCH:
	begin
	  stream0_pattern_disable = stream1_match_event;
	end
      STREAM1_PATTERN_SAMPLE:
	begin
	  stream0_pattern_disable = stream1_sample_event;
	end
      STREAM1_PATTERN_MERGED:
	begin
	  stream0_pattern_disable = stream1_merged_event;
	end
      STREAM2_PATTERN_MATCH:
	begin
	  stream0_pattern_disable = stream2_match_event;
	end
      STREAM2_PATTERN_SAMPLE:
	begin
	  stream0_pattern_disable = stream2_sample_event;
	end
      STREAM2_PATTERN_MERGED:
	begin
	  stream0_pattern_disable = stream2_merged_event;
	end
      STREAM3_PATTERN_MATCH:
	begin
	  stream0_pattern_disable = stream3_match_event;
	end
      STREAM3_PATTERN_SAMPLE:
	begin
	  stream0_pattern_disable = stream3_sample_event;
	end
      STREAM3_PATTERN_MERGED:
	begin
	  stream0_pattern_disable = stream3_merged_event;
	end
//      SIGMON_ENABLED:
//	begin
//	  stream0_pattern_disable = sigmon_enable_event;
//	end
      default: begin
	stream0_pattern_disable = 1'b0;
      end
    endcase
  end // always @ begin


  always @(*) begin
    // stream1_pattern enable selector:
    case (sigmon_stream1_pattern_ctrl2[7:0]) 
      NO_EVENT:
	begin
	  stream1_pattern_enable = 1'b0;
	end
      EVENT_TRUE:
	begin
	  stream1_pattern_enable = 1'b1;
	end
      TIMESTAMP_24TOGGLE:
	begin
	  stream1_pattern_enable = timestamp_counter_24toggle;
	end
      EVENT_FALSE:
	begin
	  stream1_pattern_enable = 1'b0;
	end
      SBU2NWPFIFO_SOP:
	begin
	  stream1_pattern_enable = sbu2nwpfifo_sop;
	end
      SBU2NWPFIFO_EOP:
	begin
	  stream1_pattern_enable = sbu2nwpfifo_eop;
	end
      SBU2NWP_SOP:
	begin
	  stream1_pattern_enable = sbu2nwp_sop;
	end
      SBU2NWP_EOP:
	begin
	  stream1_pattern_enable = sbu2nwp_eop;
	end
      NWP2SBU_SOP:
	begin
	  stream1_pattern_enable = nwp2sbu_sop;
	end
      NWP2SBU_EOP:
	begin
	  stream1_pattern_enable = nwp2sbu_eop;
	end
      SBU2CXPFIFO_SOP:
	begin
	  stream1_pattern_enable = sbu2cxpfifo_sop;
	end
      SBU2CXPFIFO_EOP:
	begin
	  stream1_pattern_enable = sbu2cxpfifo_eop;
	end
      SBU2CXP_SOP:
	begin
	  stream1_pattern_enable = sbu2cxp_sop;
	end
      SBU2CXP_EOP:
	begin
	  stream1_pattern_enable = sbu2cxp_eop;
	end
      CXP2SBU_SOP:
	begin
	  stream1_pattern_enable = cxp2sbu_sop;
	end
      CXP2SBU_EOP:
	begin
	  stream1_pattern_enable = cxp2sbu_eop;
	end
      NWP2SBU_LOSSLESS_CREDITS_ON:
	begin
	  stream1_pattern_enable = nwp2sbu_lossless_credits_on;
	end
      NWP2SBU_LOSSLESS_CREDITS_OFF:
	begin
	  stream1_pattern_enable = nwp2sbu_lossless_credits_off;
	end
      CXP2SBU_LOSSLESS_CREDITS_ON:
	begin
	  stream1_pattern_enable = cxp2sbu_lossless_credits_on;
	end
      CXP2SBU_LOSSLESS_CREDITS_OFF:
	begin
	  stream1_pattern_enable = cxp2sbu_lossless_credits_off;
	end
      NICA_EVENT0:
	begin
	  stream1_pattern_enable = nica_events[0];
	end
      NICA_EVENT1:
	begin
	  stream1_pattern_enable = nica_events[1];
	end
      NICA_EVENT2:
	begin
	  stream1_pattern_enable = nica_events[2];
	end
      NICA_EVENT3:
	begin
	  stream1_pattern_enable = nica_events[3];
	end
      NICA_EVENT4:
	begin
	  stream1_pattern_enable = nica_events[4];
	end
      NICA_EVENT5:
	begin
	  stream1_pattern_enable = nica_events[5];
	end
      NICA_EVENT6:
	begin
	  stream1_pattern_enable = nica_events[6];
	end
      NICA_EVENT7:
	begin
	  stream1_pattern_enable = nica_events[7];
	end
      NICA_EVENT8:
	begin
	  stream1_pattern_enable = nica_events[8];
	end
      NICA_EVENT9:
	begin
	  stream1_pattern_enable = nica_events[9];
	end
      LOCAL_EVENT0:
	begin
	  stream1_pattern_enable = count_events[0];
	end
      LOCAL_EVENT1:
	begin
	  stream1_pattern_enable = count_events[1];
	end
      LOCAL_EVENT2:
	begin
	  stream1_pattern_enable = count_events[2];
	end
      LOCAL_EVENT3:
	begin
	  stream1_pattern_enable = count_events[3];
	end
      LOCAL_EVENT4:
	begin
	  stream1_pattern_enable = count_events[4];
	end
      LOCAL_EVENT5:
	begin
	  stream1_pattern_enable = count_events[5];
	end
      LOCAL_EVENT6:
	begin
	  stream1_pattern_enable = count_events[6];
	end
      LOCAL_EVENT7:
	begin
	  stream1_pattern_enable = count_events[7];
	end
      LOCAL_EVENT8:
	begin
	  stream1_pattern_enable = count_events[8];
	end
      LOCAL_EVENT9:
	begin
	  stream1_pattern_enable = count_events[9];
	end
      LOCAL_EVENT10:
	begin
	  stream1_pattern_enable = count_events[10];
	end
      LOCAL_EVENT11:
	begin
	  stream1_pattern_enable = count_events[11];
	end
      DRAM_IK_WADDR:
	begin
	  stream1_pattern_enable = got_ikwaddr;
	end
      DRAM_IK_RADDR:
	begin
	  stream1_pattern_enable = got_ikraddr;
	end
      DRAM_WADDR:
	begin
	  stream1_pattern_enable = got_ddrwaddr;
	end
      DRAM_WDATA:
	begin
	  stream1_pattern_enable = got_ddrwdata;
	end
      DRAM_WDONE:
	begin
	  stream1_pattern_enable = got_ddrwdone;
	end
      DRAM_RADDR:
	begin
	  stream1_pattern_enable = got_ddrraddr;
	end
      DRAM_RDATA:
	begin
	  stream1_pattern_enable = got_ddrrdata;
	end
      DRAM_TEST_ENABLE:
	begin
	  stream1_pattern_enable = dram_test_enabled;
	end
      CLB0_START:
	begin
	  stream1_pattern_enable = clb0_events[0];
	end
      CLB0_MID:
	begin
	  stream1_pattern_enable = clb0_events[1];
	end
      CLB0_END:
	begin
	  stream1_pattern_enable = clb0_events[2];
	end
      CLB0_OUT_ON:
	begin
	  stream1_pattern_enable = clb0_out_on;
	end
      CLB0_OUT_OFF:
	begin
	  stream1_pattern_enable = clb0_out_off;
	end
      CLB1_START:
	begin
	  stream1_pattern_enable = clb1_events[0];
	end
      CLB1_MID:
	begin
	  stream1_pattern_enable = clb1_events[1];
	end
      CLB1_END:
	begin
	  stream1_pattern_enable = clb1_events[2];
	end
      CLB1_OUT_ON:
	begin
	  stream1_pattern_enable = clb1_out_on;
	end
      CLB1_OUT_OFF:
	begin
	  stream1_pattern_enable = clb1_out_off;
	end
      CLB2_START:
	begin
	  stream1_pattern_enable = clb2_events[0];
	end
      CLB2_MID:
	begin
	  stream1_pattern_enable = clb2_events[1];
	end
      CLB2_END:
	begin
	  stream1_pattern_enable = clb2_events[2];
	end
      CLB2_OUT_ON:
	begin
	  stream1_pattern_enable = clb2_out_on;
	end
      CLB2_OUT_OFF:
	begin
	  stream1_pattern_enable = clb2_out_off;
	end
      CLB3_START:
	begin
	  stream1_pattern_enable = clb3_events[0];
	end
      CLB3_MID:
	begin
	  stream1_pattern_enable = clb3_events[1];
	end
      CLB3_END:
	begin
	  stream1_pattern_enable = clb3_events[2];
	end
      CLB3_OUT_ON:
	begin
	  stream1_pattern_enable = clb3_out_on;
	end
      CLB3_OUT_OFF:
	begin
	  stream1_pattern_enable = clb3_out_off;
	end
      STREAM0_PATTERN_MATCH:
	begin
	  stream1_pattern_enable = stream0_match_event;
	end
      STREAM0_PATTERN_SAMPLE:
	begin
	  stream1_pattern_enable = stream0_sample_event;
	end
      STREAM0_PATTERN_MERGED:
	begin
	  stream1_pattern_enable = stream0_merged_event;
	end
// Aviod loop back
//    STREAM1_PATTERN_MATCH:
//	begin
//	  stream1_pattern_enable = stream1_match;
//	end
//    STREAM1_PATTERN_SAMPLE:
//	begin
//	  stream1_pattern_enable = stream1_sample;
//	end
//      STREAM1_PATTERN_MERGED:
//	begin
//	  stream1_pattern_enable = stream1_merged_event;
//	end
      STREAM2_PATTERN_MATCH:
	begin
	  stream1_pattern_enable = stream2_match_event;
	end
      STREAM2_PATTERN_SAMPLE:
	begin
	  stream1_pattern_enable = stream2_sample_event;
	end
      STREAM2_PATTERN_MERGED:
	begin
	  stream1_pattern_enable = stream2_merged_event;
	end
      STREAM3_PATTERN_MATCH:
	begin
	  stream1_pattern_enable = stream3_match_event;
	end
      STREAM3_PATTERN_SAMPLE:
	begin
	  stream1_pattern_enable = stream3_sample_event;
	end
      STREAM3_PATTERN_MERGED:
	begin
	  stream1_pattern_enable = stream3_merged_event;
	end
      SIGMON_ENABLED:
	begin
	  stream1_pattern_enable = sigmon_enable_event;
	end
      default: begin
	stream1_pattern_enable = 1'b0;
      end
    endcase

    // stream1_pattern disable selector:
    case (sigmon_stream1_pattern_ctrl2[15:8]) 
      NO_EVENT:
	begin
	  stream1_pattern_disable = 1'b0;
	end
      EVENT_TRUE:
	begin
	  stream1_pattern_disable = 1'b1;
	end
      TIMESTAMP_24TOGGLE:
	begin
	  stream1_pattern_disable = timestamp_counter_24toggle;
	end
      EVENT_FALSE:
	begin
	  stream1_pattern_disable = 1'b0;
	end
      SBU2NWPFIFO_SOP:
	begin
	  stream1_pattern_disable = sbu2nwpfifo_sop;
	end
      SBU2NWPFIFO_EOP:
	begin
	  stream1_pattern_disable = sbu2nwpfifo_eop;
	end
      SBU2NWP_SOP:
	begin
	  stream1_pattern_disable = sbu2nwp_sop;
	end
      SBU2NWP_EOP:
	begin
	  stream1_pattern_disable = sbu2nwp_eop;
	end
      NWP2SBU_SOP:
	begin
	  stream1_pattern_disable = nwp2sbu_sop;
	end
      NWP2SBU_EOP:
	begin
	  stream1_pattern_disable = nwp2sbu_eop;
	end
      SBU2CXPFIFO_SOP:
	begin
	  stream1_pattern_disable = sbu2cxpfifo_sop;
	end
      SBU2CXPFIFO_EOP:
	begin
	  stream1_pattern_disable = sbu2cxpfifo_eop;
	end
      SBU2CXP_SOP:
	begin
	  stream1_pattern_disable = sbu2cxp_sop;
	end
      SBU2CXP_EOP:
	begin
	  stream1_pattern_disable = sbu2cxp_eop;
	end
      CXP2SBU_SOP:
	begin
	  stream1_pattern_disable = cxp2sbu_sop;
	end
      CXP2SBU_EOP:
	begin
	  stream1_pattern_disable = cxp2sbu_eop;
	end
      NWP2SBU_LOSSLESS_CREDITS_ON:
	begin
	  stream1_pattern_disable = nwp2sbu_lossless_credits_on;
	end
      NWP2SBU_LOSSLESS_CREDITS_OFF:
	begin
	  stream1_pattern_disable = nwp2sbu_lossless_credits_off;
	end
      CXP2SBU_LOSSLESS_CREDITS_ON:
	begin
	  stream1_pattern_disable = cxp2sbu_lossless_credits_on;
	end
      CXP2SBU_LOSSLESS_CREDITS_OFF:
	begin
	  stream1_pattern_disable = cxp2sbu_lossless_credits_off;
	end
      NICA_EVENT0:
	begin
	  stream1_pattern_disable = nica_events[0];
	end
      NICA_EVENT1:
	begin
	  stream1_pattern_disable = nica_events[1];
	end
      NICA_EVENT2:
	begin
	  stream1_pattern_disable = nica_events[2];
	end
      NICA_EVENT3:
	begin
	  stream1_pattern_disable = nica_events[3];
	end
      NICA_EVENT4:
	begin
	  stream1_pattern_disable = nica_events[4];
	end
      NICA_EVENT5:
	begin
	  stream1_pattern_disable = nica_events[5];
	end
      NICA_EVENT6:
	begin
	  stream1_pattern_disable = nica_events[6];
	end
      NICA_EVENT7:
	begin
	  stream1_pattern_disable = nica_events[7];
	end
      NICA_EVENT8:
	begin
	  stream1_pattern_disable = nica_events[8];
	end
      NICA_EVENT9:
	begin
	  stream1_pattern_disable = nica_events[9];
	end
      LOCAL_EVENT0:
	begin
	  stream1_pattern_disable = count_events[0];
	end
      LOCAL_EVENT1:
	begin
	  stream1_pattern_disable = count_events[1];
	end
      LOCAL_EVENT2:
	begin
	  stream1_pattern_disable = count_events[2];
	end
      LOCAL_EVENT3:
	begin
	  stream1_pattern_disable = count_events[3];
	end
      LOCAL_EVENT4:
	begin
	  stream1_pattern_disable = count_events[4];
	end
      LOCAL_EVENT5:
	begin
	  stream1_pattern_disable = count_events[5];
	end
      LOCAL_EVENT6:
	begin
	  stream1_pattern_disable = count_events[6];
	end
      LOCAL_EVENT7:
	begin
	  stream1_pattern_disable = count_events[7];
	end
      LOCAL_EVENT8:
	begin
	  stream1_pattern_disable = count_events[8];
	end
      LOCAL_EVENT9:
	begin
	  stream1_pattern_disable = count_events[9];
	end
      LOCAL_EVENT10:
	begin
	  stream1_pattern_disable = count_events[10];
	end
      LOCAL_EVENT11:
	begin
	  stream1_pattern_disable = count_events[11];
	end
      DRAM_IK_WADDR:
	begin
	  stream1_pattern_disable = got_ikwaddr;
	end
      DRAM_IK_RADDR:
	begin
	  stream1_pattern_disable = got_ikraddr;
	end
      DRAM_WADDR:
	begin
	  stream1_pattern_disable = got_ddrwaddr;
	end
      DRAM_WDATA:
	begin
	  stream1_pattern_disable = got_ddrwdata;
	end
      DRAM_WDONE:
	begin
	  stream1_pattern_disable = got_ddrwdone;
	end
      DRAM_RADDR:
	begin
	  stream1_pattern_disable = got_ddrraddr;
	end
      DRAM_RDATA:
	begin
	  stream1_pattern_disable = got_ddrrdata;
	end
      DRAM_TEST_ENABLE:
	begin
	  stream1_pattern_disable = dram_test_enabled;
	end
      CLB0_START:
	begin
	  stream1_pattern_disable = clb0_events[0];
	end
      CLB0_MID:
	begin
	  stream1_pattern_disable = clb0_events[1];
	end
      CLB0_END:
	begin
	  stream1_pattern_disable = clb0_events[2];
	end
      CLB0_OUT_ON:
	begin
	  stream1_pattern_disable = clb0_out_on;
	end
      CLB0_OUT_OFF:
	begin
	  stream1_pattern_disable = clb0_out_off;
	end
      CLB1_START:
	begin
	  stream1_pattern_disable = clb1_events[0];
	end
      CLB1_MID:
	begin
	  stream1_pattern_disable = clb1_events[1];
	end
      CLB1_END:
	begin
	  stream1_pattern_disable = clb1_events[2];
	end
      CLB1_OUT_ON:
	begin
	  stream1_pattern_disable = clb1_out_on;
	end
      CLB1_OUT_OFF:
	begin
	  stream1_pattern_disable = clb1_out_off;
	end
      CLB2_START:
	begin
	  stream1_pattern_disable = clb2_events[0];
	end
      CLB2_MID:
	begin
	  stream1_pattern_disable = clb2_events[1];
	end
      CLB2_END:
	begin
	  stream1_pattern_disable = clb2_events[2];
	end
      CLB2_OUT_ON:
	begin
	  stream1_pattern_disable = clb2_out_on;
	end
      CLB2_OUT_OFF:
	begin
	  stream1_pattern_disable = clb2_out_off;
	end
      CLB3_START:
	begin
	  stream1_pattern_disable = clb3_events[0];
	end
      CLB3_MID:
	begin
	  stream1_pattern_disable = clb3_events[1];
	end
      CLB3_END:
	begin
	  stream1_pattern_disable = clb3_events[2];
	end
      CLB3_OUT_ON:
	begin
	  stream1_pattern_disable = clb3_out_on;
	end
      CLB3_OUT_OFF:
	begin
	  stream1_pattern_disable = clb3_out_off;
	end
      STREAM0_PATTERN_MATCH:
	begin
	  stream1_pattern_disable = stream0_match_event;
	end
      STREAM0_PATTERN_SAMPLE:
	begin
	  stream1_pattern_disable = stream0_sample_event;
	end
      STREAM0_PATTERN_MERGED:
	begin
	  stream1_pattern_disable = stream0_merged_event;
	end

// Loop back: Use its own output event, to disable further pattern matching/sampling
// Useful to match/sample the first occurring match/sample only.
      STREAM1_PATTERN_MATCH:
	begin
	  stream1_pattern_disable = stream1_match_event;
	end
      STREAM1_PATTERN_SAMPLE:
	begin
	  stream1_pattern_disable = stream1_sample_event;
	end
      STREAM1_PATTERN_MERGED:
	begin
	  stream1_pattern_disable = stream1_merged_event;
	end
      STREAM2_PATTERN_MATCH:
	begin
	  stream1_pattern_disable = stream2_match_event;
	end
      STREAM2_PATTERN_SAMPLE:
	begin
	  stream1_pattern_disable = stream2_sample_event;
	end
      STREAM2_PATTERN_MERGED:
	begin
	  stream1_pattern_disable = stream2_merged_event;
	end
      STREAM3_PATTERN_MATCH:
	begin
	  stream1_pattern_disable = stream3_match_event;
	end
      STREAM3_PATTERN_SAMPLE:
	begin
	  stream1_pattern_disable = stream3_sample_event;
	end
      STREAM3_PATTERN_MERGED:
	begin
	  stream1_pattern_disable = stream3_merged_event;
	end
//      SIGMON_ENABLED:
//	begin
//	  stream1_pattern_disable = sigmon_enable_event;
//	end
      default: begin
	stream1_pattern_disable = 1'b0;
      end
    endcase
  end // always @ begin


  always @(*) begin
    // stream2_pattern enable selector:
    case (sigmon_stream2_pattern_ctrl2[7:0]) 
      NO_EVENT:
	begin
	  stream2_pattern_enable = 1'b0;
	end
      EVENT_TRUE:
	begin
	  stream2_pattern_enable = 1'b1;
	end
      TIMESTAMP_24TOGGLE:
	begin
	  stream2_pattern_enable = timestamp_counter_24toggle;
	end
      EVENT_FALSE:
	begin
	  stream2_pattern_enable = 1'b0;
	end
      SBU2NWPFIFO_SOP:
	begin
	  stream2_pattern_enable = sbu2nwpfifo_sop;
	end
      SBU2NWPFIFO_EOP:
	begin
	  stream2_pattern_enable = sbu2nwpfifo_eop;
	end
      SBU2NWP_SOP:
	begin
	  stream2_pattern_enable = sbu2nwp_sop;
	end
      SBU2NWP_EOP:
	begin
	  stream2_pattern_enable = sbu2nwp_eop;
	end
      NWP2SBU_SOP:
	begin
	  stream2_pattern_enable = nwp2sbu_sop;
	end
      NWP2SBU_EOP:
	begin
	  stream2_pattern_enable = nwp2sbu_eop;
	end
      SBU2CXPFIFO_SOP:
	begin
	  stream2_pattern_enable = sbu2cxpfifo_sop;
	end
      SBU2CXPFIFO_EOP:
	begin
	  stream2_pattern_enable = sbu2cxpfifo_eop;
	end
      SBU2CXP_SOP:
	begin
	  stream2_pattern_enable = sbu2cxp_sop;
	end
      SBU2CXP_EOP:
	begin
	  stream2_pattern_enable = sbu2cxp_eop;
	end
      CXP2SBU_SOP:
	begin
	  stream2_pattern_enable = cxp2sbu_sop;
	end
      CXP2SBU_EOP:
	begin
	  stream2_pattern_enable = cxp2sbu_eop;
	end
      NWP2SBU_LOSSLESS_CREDITS_ON:
	begin
	  stream2_pattern_enable = nwp2sbu_lossless_credits_on;
	end
      NWP2SBU_LOSSLESS_CREDITS_OFF:
	begin
	  stream2_pattern_enable = nwp2sbu_lossless_credits_off;
	end
      CXP2SBU_LOSSLESS_CREDITS_ON:
	begin
	  stream2_pattern_enable = cxp2sbu_lossless_credits_on;
	end
      CXP2SBU_LOSSLESS_CREDITS_OFF:
	begin
	  stream2_pattern_enable = cxp2sbu_lossless_credits_off;
	end
      NICA_EVENT0:
	begin
	  stream2_pattern_enable = nica_events[0];
	end
      NICA_EVENT1:
	begin
	  stream2_pattern_enable = nica_events[1];
	end
      NICA_EVENT2:
	begin
	  stream2_pattern_enable = nica_events[2];
	end
      NICA_EVENT3:
	begin
	  stream2_pattern_enable = nica_events[3];
	end
      NICA_EVENT4:
	begin
	  stream2_pattern_enable = nica_events[4];
	end
      NICA_EVENT5:
	begin
	  stream2_pattern_enable = nica_events[5];
	end
      NICA_EVENT6:
	begin
	  stream2_pattern_enable = nica_events[6];
	end
      NICA_EVENT7:
	begin
	  stream2_pattern_enable = nica_events[7];
	end
      NICA_EVENT8:
	begin
	  stream2_pattern_enable = nica_events[8];
	end
      NICA_EVENT9:
	begin
	  stream2_pattern_enable = nica_events[9];
	end
      LOCAL_EVENT0:
	begin
	  stream2_pattern_enable = count_events[0];
	end
      LOCAL_EVENT1:
	begin
	  stream2_pattern_enable = count_events[1];
	end
      LOCAL_EVENT2:
	begin
	  stream2_pattern_enable = count_events[2];
	end
      LOCAL_EVENT3:
	begin
	  stream2_pattern_enable = count_events[3];
	end
      LOCAL_EVENT4:
	begin
	  stream2_pattern_enable = count_events[4];
	end
      LOCAL_EVENT5:
	begin
	  stream2_pattern_enable = count_events[5];
	end
      LOCAL_EVENT6:
	begin
	  stream2_pattern_enable = count_events[6];
	end
      LOCAL_EVENT7:
	begin
	  stream2_pattern_enable = count_events[7];
	end
      LOCAL_EVENT8:
	begin
	  stream2_pattern_enable = count_events[8];
	end
      LOCAL_EVENT9:
	begin
	  stream2_pattern_enable = count_events[9];
	end
      LOCAL_EVENT10:
	begin
	  stream2_pattern_enable = count_events[10];
	end
      LOCAL_EVENT11:
	begin
	  stream2_pattern_enable = count_events[11];
	end
      DRAM_IK_WADDR:
	begin
	  stream2_pattern_enable = got_ikwaddr;
	end
      DRAM_IK_RADDR:
	begin
	  stream2_pattern_enable = got_ikraddr;
	end
      DRAM_WADDR:
	begin
	  stream2_pattern_enable = got_ddrwaddr;
	end
      DRAM_WDATA:
	begin
	  stream2_pattern_enable = got_ddrwdata;
	end
      DRAM_WDONE:
	begin
	  stream2_pattern_enable = got_ddrwdone;
	end
      DRAM_RADDR:
	begin
	  stream2_pattern_enable = got_ddrraddr;
	end
      DRAM_RDATA:
	begin
	  stream2_pattern_enable = got_ddrrdata;
	end
      DRAM_TEST_ENABLE:
	begin
	  stream2_pattern_enable = dram_test_enabled;
	end
      CLB0_START:
	begin
	  stream2_pattern_enable = clb0_events[0];
	end
      CLB0_MID:
	begin
	  stream2_pattern_enable = clb0_events[1];
	end
      CLB0_END:
	begin
	  stream2_pattern_enable = clb0_events[2];
	end
      CLB0_OUT_ON:
	begin
	  stream2_pattern_enable = clb0_out_on;
	end
      CLB0_OUT_OFF:
	begin
	  stream2_pattern_enable = clb0_out_off;
	end
      CLB1_START:
	begin
	  stream2_pattern_enable = clb1_events[0];
	end
      CLB1_MID:
	begin
	  stream2_pattern_enable = clb1_events[1];
	end
      CLB1_END:
	begin
	  stream2_pattern_enable = clb1_events[2];
	end
      CLB1_OUT_ON:
	begin
	  stream2_pattern_enable = clb1_out_on;
	end
      CLB1_OUT_OFF:
	begin
	  stream2_pattern_enable = clb1_out_off;
	end
      CLB2_START:
	begin
	  stream2_pattern_enable = clb2_events[0];
	end
      CLB2_MID:
	begin
	  stream2_pattern_enable = clb2_events[1];
	end
      CLB2_END:
	begin
	  stream2_pattern_enable = clb2_events[2];
	end
      CLB2_OUT_ON:
	begin
	  stream2_pattern_enable = clb2_out_on;
	end
      CLB2_OUT_OFF:
	begin
	  stream2_pattern_enable = clb2_out_off;
	end
      CLB3_START:
	begin
	  stream2_pattern_enable = clb3_events[0];
	end
      CLB3_MID:
	begin
	  stream2_pattern_enable = clb3_events[1];
	end
      CLB3_END:
	begin
	  stream2_pattern_enable = clb3_events[2];
	end
      CLB3_OUT_ON:
	begin
	  stream2_pattern_enable = clb3_out_on;
	end
      CLB3_OUT_OFF:
	begin
	  stream2_pattern_enable = clb3_out_off;
	end
      STREAM0_PATTERN_MATCH:
	begin
	  stream2_pattern_enable = stream0_match_event;
	end
      STREAM0_PATTERN_SAMPLE:
	begin
	  stream2_pattern_enable = stream0_sample_event;
	end
      STREAM0_PATTERN_MERGED:
	begin
	  stream2_pattern_enable = stream0_merged_event;
	end
      STREAM1_PATTERN_MATCH:
	begin
	  stream2_pattern_enable = stream1_match_event;
	end
      STREAM1_PATTERN_SAMPLE:
	begin
	  stream2_pattern_enable = stream1_sample_event;
	end
      STREAM1_PATTERN_MERGED:
	begin
	  stream2_pattern_enable = stream1_merged_event;
	end
// Aviod loop back
//    STREAM2_PATTERN_MATCH:
//	begin
//	  stream2_pattern_enable = stream2_match;
//	end
//    STREAM2_PATTERN_SAMPLE:
//	begin
//	  stream2_pattern_enable = stream2_sample;
//	end
//      STREAM2_PATTERN_MERGED:
//	begin
//	  stream2_pattern_enable = stream2_merged_event;
//	end
      STREAM3_PATTERN_MATCH:
	begin
	  stream2_pattern_enable = stream3_match_event;
	end
      STREAM3_PATTERN_SAMPLE:
	begin
	  stream2_pattern_enable = stream3_sample_event;
	end
      STREAM3_PATTERN_MERGED:
	begin
	  stream2_pattern_enable = stream3_merged_event;
	end
      SIGMON_ENABLED:
	begin
	  stream2_pattern_enable = sigmon_enable_event;
	end
      default: begin
	stream2_pattern_enable = 1'b0;
      end
    endcase

    // stream2_pattern disable selector:
    case (sigmon_stream2_pattern_ctrl2[15:8]) 
      NO_EVENT:
	begin
	  stream2_pattern_disable = 1'b0;
	end
      EVENT_TRUE:
	begin
	  stream2_pattern_disable = 1'b1;
	end
      TIMESTAMP_24TOGGLE:
	begin
	  stream2_pattern_disable = timestamp_counter_24toggle;
	end
      EVENT_FALSE:
	begin
	  stream2_pattern_disable = 1'b0;
	end
      SBU2NWPFIFO_SOP:
	begin
	  stream2_pattern_disable = sbu2nwpfifo_sop;
	end
      SBU2NWPFIFO_EOP:
	begin
	  stream2_pattern_disable = sbu2nwpfifo_eop;
	end
      SBU2NWP_SOP:
	begin
	  stream2_pattern_disable = sbu2nwp_sop;
	end
      SBU2NWP_EOP:
	begin
	  stream2_pattern_disable = sbu2nwp_eop;
	end
      NWP2SBU_SOP:
	begin
	  stream2_pattern_disable = nwp2sbu_sop;
	end
      NWP2SBU_EOP:
	begin
	  stream2_pattern_disable = nwp2sbu_eop;
	end
      SBU2CXPFIFO_SOP:
	begin
	  stream2_pattern_disable = sbu2cxpfifo_sop;
	end
      SBU2CXPFIFO_EOP:
	begin
	  stream2_pattern_disable = sbu2cxpfifo_eop;
	end
      SBU2CXP_SOP:
	begin
	  stream2_pattern_disable = sbu2cxp_sop;
	end
      SBU2CXP_EOP:
	begin
	  stream2_pattern_disable = sbu2cxp_eop;
	end
      CXP2SBU_SOP:
	begin
	  stream2_pattern_disable = cxp2sbu_sop;
	end
      CXP2SBU_EOP:
	begin
	  stream2_pattern_disable = cxp2sbu_eop;
	end
      NWP2SBU_LOSSLESS_CREDITS_ON:
	begin
	  stream2_pattern_disable = nwp2sbu_lossless_credits_on;
	end
      NWP2SBU_LOSSLESS_CREDITS_OFF:
	begin
	  stream2_pattern_disable = nwp2sbu_lossless_credits_off;
	end
      CXP2SBU_LOSSLESS_CREDITS_ON:
	begin
	  stream2_pattern_disable = cxp2sbu_lossless_credits_on;
	end
      CXP2SBU_LOSSLESS_CREDITS_OFF:
	begin
	  stream2_pattern_disable = cxp2sbu_lossless_credits_off;
	end
      NICA_EVENT0:
	begin
	  stream2_pattern_disable = nica_events[0];
	end
      NICA_EVENT1:
	begin
	  stream2_pattern_disable = nica_events[1];
	end
      NICA_EVENT2:
	begin
	  stream2_pattern_disable = nica_events[2];
	end
      NICA_EVENT3:
	begin
	  stream2_pattern_disable = nica_events[3];
	end
      NICA_EVENT4:
	begin
	  stream2_pattern_disable = nica_events[4];
	end
      NICA_EVENT5:
	begin
	  stream2_pattern_disable = nica_events[5];
	end
      NICA_EVENT6:
	begin
	  stream2_pattern_disable = nica_events[6];
	end
      NICA_EVENT7:
	begin
	  stream2_pattern_disable = nica_events[7];
	end
      NICA_EVENT8:
	begin
	  stream2_pattern_disable = nica_events[8];
	end
      NICA_EVENT9:
	begin
	  stream2_pattern_disable = nica_events[9];
	end
      LOCAL_EVENT0:
	begin
	  stream2_pattern_disable = count_events[0];
	end
      LOCAL_EVENT1:
	begin
	  stream2_pattern_disable = count_events[1];
	end
      LOCAL_EVENT2:
	begin
	  stream2_pattern_disable = count_events[2];
	end
      LOCAL_EVENT3:
	begin
	  stream2_pattern_disable = count_events[3];
	end
      LOCAL_EVENT4:
	begin
	  stream2_pattern_disable = count_events[4];
	end
      LOCAL_EVENT5:
	begin
	  stream2_pattern_disable = count_events[5];
	end
      LOCAL_EVENT6:
	begin
	  stream2_pattern_disable = count_events[6];
	end
      LOCAL_EVENT7:
	begin
	  stream2_pattern_disable = count_events[7];
	end
      LOCAL_EVENT8:
	begin
	  stream2_pattern_disable = count_events[8];
	end
      LOCAL_EVENT9:
	begin
	  stream2_pattern_disable = count_events[9];
	end
      LOCAL_EVENT10:
	begin
	  stream2_pattern_disable = count_events[10];
	end
      LOCAL_EVENT11:
	begin
	  stream2_pattern_disable = count_events[11];
	end
      DRAM_IK_WADDR:
	begin
	  stream2_pattern_disable = got_ikwaddr;
	end
      DRAM_IK_RADDR:
	begin
	  stream2_pattern_disable = got_ikraddr;
	end
      DRAM_WADDR:
	begin
	  stream2_pattern_disable = got_ddrwaddr;
	end
      DRAM_WDATA:
	begin
	  stream2_pattern_disable = got_ddrwdata;
	end
      DRAM_WDONE:
	begin
	  stream2_pattern_disable = got_ddrwdone;
	end
      DRAM_RADDR:
	begin
	  stream2_pattern_disable = got_ddrraddr;
	end
      DRAM_RDATA:
	begin
	  stream2_pattern_disable = got_ddrrdata;
	end
      DRAM_TEST_ENABLE:
	begin
	  stream2_pattern_disable = dram_test_enabled;
	end
      CLB0_START:
	begin
	  stream2_pattern_disable = clb0_events[0];
	end
      CLB0_MID:
	begin
	  stream2_pattern_disable = clb0_events[1];
	end
      CLB0_END:
	begin
	  stream2_pattern_disable = clb0_events[2];
	end
      CLB1_END:
	begin
	  stream2_pattern_disable = clb1_events[2];
	end
      CLB0_OUT_ON:
	begin
	  stream2_pattern_disable = clb0_out_on;
	end
      CLB0_OUT_OFF:
	begin
	  stream2_pattern_disable = clb0_out_off;
	end
      CLB1_START:
	begin
	  stream2_pattern_disable = clb1_events[0];
	end
      CLB1_MID:
	begin
	  stream2_pattern_disable = clb1_events[1];
	end
      CLB1_OUT_ON:
	begin
	  stream2_pattern_disable = clb1_out_on;
	end
      CLB1_OUT_OFF:
	begin
	  stream2_pattern_disable = clb1_out_off;
	end
      CLB2_START:
	begin
	  stream2_pattern_disable = clb2_events[0];
	end
      CLB2_MID:
	begin
	  stream2_pattern_disable = clb2_events[1];
	end
      CLB2_END:
	begin
	  stream2_pattern_disable = clb2_events[2];
	end
      CLB2_OUT_ON:
	begin
	  stream2_pattern_disable = clb2_out_on;
	end
      CLB2_OUT_OFF:
	begin
	  stream2_pattern_disable = clb2_out_off;
	end
      CLB3_START:
	begin
	  stream2_pattern_disable = clb3_events[0];
	end
      CLB3_MID:
	begin
	  stream2_pattern_disable = clb3_events[1];
	end
      CLB3_END:
	begin
	  stream2_pattern_disable = clb3_events[2];
	end
      CLB3_OUT_ON:
	begin
	  stream2_pattern_disable = clb3_out_on;
	end
      CLB3_OUT_OFF:
	begin
	  stream2_pattern_disable = clb3_out_off;
	end
      STREAM0_PATTERN_MATCH:
	begin
	  stream2_pattern_disable = stream0_match_event;
	end
      STREAM0_PATTERN_SAMPLE:
	begin
	  stream2_pattern_disable = stream0_sample_event;
	end
      STREAM0_PATTERN_MERGED:
	begin
	  stream2_pattern_disable = stream0_merged_event;
	end
      STREAM1_PATTERN_MATCH:
	begin
	  stream2_pattern_disable = stream1_match_event;
	end
      STREAM1_PATTERN_SAMPLE:
	begin
	  stream2_pattern_disable = stream1_sample_event;
	end
      STREAM1_PATTERN_MERGED:
	begin
	  stream2_pattern_disable = stream1_merged_event;
	end

// Loop back: Use its own output event, to disable further pattern matching/sampling
// Useful to match/sample the first occurring match/sample only.
      STREAM2_PATTERN_MATCH:
	begin
	  stream2_pattern_disable = stream2_match_event;
	end
      STREAM2_PATTERN_SAMPLE:
	begin
	  stream2_pattern_disable = stream2_sample_event;
	end
      STREAM2_PATTERN_MERGED:
	begin
	  stream2_pattern_disable = stream2_merged_event;
	end
      STREAM3_PATTERN_MATCH:
	begin
	  stream2_pattern_disable = stream3_match_event;
	end
      STREAM3_PATTERN_SAMPLE:
	begin
	  stream2_pattern_disable = stream3_sample_event;
	end
      STREAM3_PATTERN_MERGED:
	begin
	  stream2_pattern_disable = stream3_merged_event;
	end
//      SIGMON_ENABLED:
//	begin
//	  stream2_pattern_disable = sigmon_enable_event;
//	end
      default: begin
	stream2_pattern_disable = 1'b0;
      end
    endcase
  end // always @ begin


  always @(*) begin
    // stream3_pattern enable selector:
    case (sigmon_stream3_pattern_ctrl2[7:0]) 
      NO_EVENT:
	begin
	  stream3_pattern_enable = 1'b0;
	end
      EVENT_TRUE:
	begin
	  stream3_pattern_enable = 1'b1;
	end
      TIMESTAMP_24TOGGLE:
	begin
	  stream3_pattern_enable = timestamp_counter_24toggle;
	end
      EVENT_FALSE:
	begin
	  stream3_pattern_enable = 1'b0;
	end
      SBU2NWPFIFO_SOP:
	begin
	  stream3_pattern_enable = sbu2nwpfifo_sop;
	end
      SBU2NWPFIFO_EOP:
	begin
	  stream3_pattern_enable = sbu2nwpfifo_eop;
	end
      SBU2NWP_SOP:
	begin
	  stream3_pattern_enable = sbu2nwp_sop;
	end
      SBU2NWP_EOP:
	begin
	  stream3_pattern_enable = sbu2nwp_eop;
	end
      NWP2SBU_SOP:
	begin
	  stream3_pattern_enable = nwp2sbu_sop;
	end
      NWP2SBU_EOP:
	begin
	  stream3_pattern_enable = nwp2sbu_eop;
	end
      SBU2CXPFIFO_SOP:
	begin
	  stream3_pattern_enable = sbu2cxpfifo_sop;
	end
      SBU2CXPFIFO_EOP:
	begin
	  stream3_pattern_enable = sbu2cxpfifo_eop;
	end
      SBU2CXP_SOP:
	begin
	  stream3_pattern_enable = sbu2cxp_sop;
	end
      SBU2CXP_EOP:
	begin
	  stream3_pattern_enable = sbu2cxp_eop;
	end
      CXP2SBU_SOP:
	begin
	  stream3_pattern_enable = cxp2sbu_sop;
	end
      CXP2SBU_EOP:
	begin
	  stream3_pattern_enable = cxp2sbu_eop;
	end
      NWP2SBU_LOSSLESS_CREDITS_ON:
	begin
	  stream3_pattern_enable = nwp2sbu_lossless_credits_on;
	end
      NWP2SBU_LOSSLESS_CREDITS_OFF:
	begin
	  stream3_pattern_enable = nwp2sbu_lossless_credits_off;
	end
      CXP2SBU_LOSSLESS_CREDITS_ON:
	begin
	  stream3_pattern_enable = cxp2sbu_lossless_credits_on;
	end
      CXP2SBU_LOSSLESS_CREDITS_OFF:
	begin
	  stream3_pattern_enable = cxp2sbu_lossless_credits_off;
	end
      NICA_EVENT0:
	begin
	  stream3_pattern_enable = nica_events[0];
	end
      NICA_EVENT1:
	begin
	  stream3_pattern_enable = nica_events[1];
	end
      NICA_EVENT2:
	begin
	  stream3_pattern_enable = nica_events[2];
	end
      NICA_EVENT3:
	begin
	  stream3_pattern_enable = nica_events[3];
	end
      NICA_EVENT4:
	begin
	  stream3_pattern_enable = nica_events[4];
	end
      NICA_EVENT5:
	begin
	  stream3_pattern_enable = nica_events[5];
	end
      NICA_EVENT6:
	begin
	  stream3_pattern_enable = nica_events[6];
	end
      NICA_EVENT7:
	begin
	  stream3_pattern_enable = nica_events[7];
	end
      NICA_EVENT8:
	begin
	  stream3_pattern_enable = nica_events[8];
	end
      NICA_EVENT9:
	begin
	  stream3_pattern_enable = nica_events[9];
	end
      LOCAL_EVENT0:
	begin
	  stream3_pattern_enable = count_events[0];
	end
      LOCAL_EVENT1:
	begin
	  stream3_pattern_enable = count_events[1];
	end
      LOCAL_EVENT2:
	begin
	  stream3_pattern_enable = count_events[2];
	end
      LOCAL_EVENT3:
	begin
	  stream3_pattern_enable = count_events[3];
	end
      LOCAL_EVENT4:
	begin
	  stream3_pattern_enable = count_events[4];
	end
      LOCAL_EVENT5:
	begin
	  stream3_pattern_enable = count_events[5];
	end
      LOCAL_EVENT6:
	begin
	  stream3_pattern_enable = count_events[6];
	end
      LOCAL_EVENT7:
	begin
	  stream3_pattern_enable = count_events[7];
	end
      LOCAL_EVENT8:
	begin
	  stream3_pattern_enable = count_events[8];
	end
      LOCAL_EVENT9:
	begin
	  stream3_pattern_enable = count_events[9];
	end
      LOCAL_EVENT10:
	begin
	  stream3_pattern_enable = count_events[10];
	end
      LOCAL_EVENT11:
	begin
	  stream3_pattern_enable = count_events[11];
	end
      DRAM_IK_WADDR:
	begin
	  stream3_pattern_enable = got_ikwaddr;
	end
      DRAM_IK_RADDR:
	begin
	  stream3_pattern_enable = got_ikraddr;
	end
      DRAM_WADDR:
	begin
	  stream3_pattern_enable = got_ddrwaddr;
	end
      DRAM_WDATA:
	begin
	  stream3_pattern_enable = got_ddrwdata;
	end
      DRAM_WDONE:
	begin
	  stream3_pattern_enable = got_ddrwdone;
	end
      DRAM_RADDR:
	begin
	  stream3_pattern_enable = got_ddrraddr;
	end
      DRAM_RDATA:
	begin
	  stream3_pattern_enable = got_ddrrdata;
	end
      DRAM_TEST_ENABLE:
	begin
	  stream3_pattern_enable = dram_test_enabled;
	end
      CLB0_START:
	begin
	  stream3_pattern_enable = clb0_events[0];
	end
      CLB0_MID:
	begin
	  stream3_pattern_enable = clb0_events[1];
	end
      CLB0_END:
	begin
	  stream3_pattern_enable = clb0_events[2];
	end
      CLB0_OUT_ON:
	begin
	  stream3_pattern_enable = clb0_out_on;
	end
      CLB0_OUT_OFF:
	begin
	  stream3_pattern_enable = clb0_out_off;
	end
      CLB1_START:
	begin
	  stream3_pattern_enable = clb1_events[0];
	end
      CLB1_MID:
	begin
	  stream3_pattern_enable = clb1_events[1];
	end
      CLB1_END:
	begin
	  stream3_pattern_enable = clb1_events[2];
	end
      CLB1_OUT_ON:
	begin
	  stream3_pattern_enable = clb1_out_on;
	end
      CLB1_OUT_OFF:
	begin
	  stream3_pattern_enable = clb1_out_off;
	end
      CLB2_START:
	begin
	  stream3_pattern_enable = clb2_events[0];
	end
      CLB2_MID:
	begin
	  stream3_pattern_enable = clb2_events[1];
	end
      CLB2_END:
	begin
	  stream3_pattern_enable = clb2_events[2];
	end
      CLB2_OUT_ON:
	begin
	  stream3_pattern_enable = clb2_out_on;
	end
      CLB2_OUT_OFF:
	begin
	  stream3_pattern_enable = clb2_out_off;
	end
      CLB3_START:
	begin
	  stream3_pattern_enable = clb3_events[0];
	end
      CLB3_MID:
	begin
	  stream3_pattern_enable = clb3_events[1];
	end
      CLB3_END:
	begin
	  stream3_pattern_enable = clb3_events[2];
	end
      CLB3_OUT_ON:
	begin
	  stream3_pattern_enable = clb3_out_on;
	end
      CLB3_OUT_OFF:
	begin
	  stream3_pattern_enable = clb3_out_off;
	end
      STREAM0_PATTERN_MATCH:
	begin
	  stream3_pattern_enable = stream0_match_event;
	end
      STREAM0_PATTERN_SAMPLE:
	begin
	  stream3_pattern_enable = stream0_sample_event;
	end
      STREAM0_PATTERN_MERGED:
	begin
	  stream3_pattern_enable = stream0_merged_event;
	end
      STREAM1_PATTERN_MATCH:
	begin
	  stream3_pattern_enable = stream1_match_event;
	end
      STREAM1_PATTERN_SAMPLE:
	begin
	  stream3_pattern_enable = stream1_sample_event;
	end
      STREAM1_PATTERN_MERGED:
	begin
	  stream3_pattern_enable = stream1_merged_event;
	end
      STREAM2_PATTERN_MATCH:
	begin
	  stream3_pattern_enable = stream2_match_event;
	end
      STREAM2_PATTERN_SAMPLE:
	begin
	  stream3_pattern_enable = stream2_sample_event;
	end
      STREAM2_PATTERN_MERGED:
	begin
	  stream3_pattern_enable = stream2_merged_event;
	end
// Aviod loop back
//    STREAM3_PATTERN_MATCH:
//	begin
//	  stream3_pattern_enable = stream3_match;
//	end
//    STREAM3_PATTERN_SAMPLE:
//	begin
//	  stream3_pattern_enable = stream3_sample;
//	end
//      STREAM3_PATTERN_MERGED:
//	begin
//	  stream3_pattern_enable = stream3_merged_event;
//	end
      SIGMON_ENABLED:
	begin
	  stream3_pattern_enable = sigmon_enable_event;
	end
      default: begin
	stream3_pattern_enable = 1'b0;
      end
    endcase

    // stream3_pattern disable selector:
    case (sigmon_stream3_pattern_ctrl2[15:8]) 
      NO_EVENT:
	begin
	  stream3_pattern_disable = 1'b0;
	end
      EVENT_TRUE:
	begin
	  stream3_pattern_disable = 1'b1;
	end
      TIMESTAMP_24TOGGLE:
	begin
	  stream3_pattern_disable = timestamp_counter_24toggle;
	end
      EVENT_FALSE:
	begin
	  stream3_pattern_disable = 1'b0;
	end
      SBU2NWPFIFO_SOP:
	begin
	  stream3_pattern_disable = sbu2nwpfifo_sop;
	end
      SBU2NWPFIFO_EOP:
	begin
	  stream3_pattern_disable = sbu2nwpfifo_eop;
	end
      SBU2NWP_SOP:
	begin
	  stream3_pattern_disable = sbu2nwp_sop;
	end
      SBU2NWP_EOP:
	begin
	  stream3_pattern_disable = sbu2nwp_eop;
	end
      NWP2SBU_SOP:
	begin
	  stream3_pattern_disable = nwp2sbu_sop;
	end
      NWP2SBU_EOP:
	begin
	  stream3_pattern_disable = nwp2sbu_eop;
	end
      SBU2CXPFIFO_SOP:
	begin
	  stream3_pattern_disable = sbu2cxpfifo_sop;
	end
      SBU2CXPFIFO_EOP:
	begin
	  stream3_pattern_disable = sbu2cxpfifo_eop;
	end
      SBU2CXP_SOP:
	begin
	  stream3_pattern_disable = sbu2cxp_sop;
	end
      SBU2CXP_EOP:
	begin
	  stream3_pattern_disable = sbu2cxp_eop;
	end
      CXP2SBU_SOP:
	begin
	  stream3_pattern_disable = cxp2sbu_sop;
	end
      CXP2SBU_EOP:
	begin
	  stream3_pattern_disable = cxp2sbu_eop;
	end
      NWP2SBU_LOSSLESS_CREDITS_ON:
	begin
	  stream3_pattern_disable = nwp2sbu_lossless_credits_on;
	end
      NWP2SBU_LOSSLESS_CREDITS_OFF:
	begin
	  stream3_pattern_disable = nwp2sbu_lossless_credits_off;
	end
      CXP2SBU_LOSSLESS_CREDITS_ON:
	begin
	  stream3_pattern_disable = cxp2sbu_lossless_credits_on;
	end
      CXP2SBU_LOSSLESS_CREDITS_OFF:
	begin
	  stream3_pattern_disable = cxp2sbu_lossless_credits_off;
	end
      NICA_EVENT0:
	begin
	  stream3_pattern_disable = nica_events[0];
	end
      NICA_EVENT1:
	begin
	  stream3_pattern_disable = nica_events[1];
	end
      NICA_EVENT2:
	begin
	  stream3_pattern_disable = nica_events[2];
	end
      NICA_EVENT3:
	begin
	  stream3_pattern_disable = nica_events[3];
	end
      NICA_EVENT4:
	begin
	  stream3_pattern_disable = nica_events[4];
	end
      NICA_EVENT5:
	begin
	  stream3_pattern_disable = nica_events[5];
	end
      NICA_EVENT6:
	begin
	  stream3_pattern_disable = nica_events[6];
	end
      NICA_EVENT7:
	begin
	  stream3_pattern_disable = nica_events[7];
	end
      NICA_EVENT8:
	begin
	  stream3_pattern_disable = nica_events[8];
	end
      NICA_EVENT9:
	begin
	  stream3_pattern_disable = nica_events[9];
	end
      LOCAL_EVENT0:
	begin
	  stream3_pattern_disable = count_events[0];
	end
      LOCAL_EVENT1:
	begin
	  stream3_pattern_disable = count_events[1];
	end
      LOCAL_EVENT2:
	begin
	  stream3_pattern_disable = count_events[2];
	end
      LOCAL_EVENT3:
	begin
	  stream3_pattern_disable = count_events[3];
	end
      LOCAL_EVENT4:
	begin
	  stream3_pattern_disable = count_events[4];
	end
      LOCAL_EVENT5:
	begin
	  stream3_pattern_disable = count_events[5];
	end
      LOCAL_EVENT6:
	begin
	  stream3_pattern_disable = count_events[6];
	end
      LOCAL_EVENT7:
	begin
	  stream3_pattern_disable = count_events[7];
	end
      LOCAL_EVENT8:
	begin
	  stream3_pattern_disable = count_events[8];
	end
      LOCAL_EVENT9:
	begin
	  stream3_pattern_disable = count_events[9];
	end
      LOCAL_EVENT10:
	begin
	  stream3_pattern_disable = count_events[10];
	end
      LOCAL_EVENT11:
	begin
	  stream3_pattern_disable = count_events[11];
	end
      DRAM_IK_WADDR:
	begin
	  stream3_pattern_disable = got_ikwaddr;
	end
      DRAM_IK_RADDR:
	begin
	  stream3_pattern_disable = got_ikraddr;
	end
      DRAM_WADDR:
	begin
	  stream3_pattern_disable = got_ddrwaddr;
	end
      DRAM_WDATA:
	begin
	  stream3_pattern_disable = got_ddrwdata;
	end
      DRAM_WDONE:
	begin
	  stream3_pattern_disable = got_ddrwdone;
	end
      DRAM_RADDR:
	begin
	  stream3_pattern_disable = got_ddrraddr;
	end
      DRAM_RDATA:
	begin
	  stream3_pattern_disable = got_ddrrdata;
	end
      DRAM_TEST_ENABLE:
	begin
	  stream3_pattern_disable = dram_test_enabled;
	end
      CLB0_START:
	begin
	  stream3_pattern_disable = clb0_events[0];
	end
      CLB0_MID:
	begin
	  stream3_pattern_disable = clb0_events[1];
	end
      CLB0_END:
	begin
	  stream3_pattern_disable = clb0_events[2];
	end
      CLB0_OUT_ON:
	begin
	  stream3_pattern_disable = clb0_out_on;
	end
      CLB0_OUT_OFF:
	begin
	  stream3_pattern_disable = clb0_out_off;
	end
      CLB1_START:
	begin
	  stream3_pattern_disable = clb1_events[0];
	end
      CLB1_MID:
	begin
	  stream3_pattern_disable = clb1_events[1];
	end
      CLB1_END:
	begin
	  stream3_pattern_disable = clb1_events[2];
	end
      CLB1_OUT_ON:
	begin
	  stream3_pattern_disable = clb1_out_on;
	end
      CLB1_OUT_OFF:
	begin
	  stream3_pattern_disable = clb1_out_off;
	end
      CLB2_START:
	begin
	  stream3_pattern_disable = clb2_events[0];
	end
      CLB2_MID:
	begin
	  stream3_pattern_disable = clb2_events[1];
	end
      CLB2_END:
	begin
	  stream3_pattern_disable = clb2_events[2];
	end
      CLB2_OUT_ON:
	begin
	  stream3_pattern_disable = clb2_out_on;
	end
      CLB2_OUT_OFF:
	begin
	  stream3_pattern_disable = clb2_out_off;
	end
      CLB3_START:
	begin
	  stream3_pattern_disable = clb3_events[0];
	end
      CLB3_MID:
	begin
	  stream3_pattern_disable = clb3_events[1];
	end
      CLB3_END:
	begin
	  stream3_pattern_disable = clb3_events[2];
	end
      CLB3_OUT_ON:
	begin
	  stream3_pattern_disable = clb3_out_on;
	end
      CLB3_OUT_OFF:
	begin
	  stream3_pattern_disable = clb3_out_off;
	end
      STREAM0_PATTERN_MATCH:
	begin
	  stream3_pattern_disable = stream0_match_event;
	end
      STREAM0_PATTERN_SAMPLE:
	begin
	  stream3_pattern_disable = stream0_sample_event;
	end
      STREAM0_PATTERN_MERGED:
	begin
	  stream3_pattern_disable = stream0_merged_event;
	end
      STREAM1_PATTERN_MATCH:
	begin
	  stream3_pattern_disable = stream1_match_event;
	end
      STREAM1_PATTERN_SAMPLE:
	begin
	  stream3_pattern_disable = stream1_sample_event;
	end
      STREAM1_PATTERN_MERGED:
	begin
	  stream3_pattern_disable = stream1_merged_event;
	end
      STREAM2_PATTERN_MATCH:
	begin
	  stream3_pattern_disable = stream2_match_event;
	end
      STREAM2_PATTERN_SAMPLE:
	begin
	  stream3_pattern_disable = stream2_sample_event;
	end
      STREAM2_PATTERN_MERGED:
	begin
	  stream3_pattern_disable = stream2_merged_event;
	end

// Loop back: Use its own output event, to disable further pattern matching/sampling
// Useful to match/sample the first occurring match/sample only.
      STREAM3_PATTERN_MATCH:
	begin
	  stream3_pattern_disable = stream3_match_event;
	end
      STREAM3_PATTERN_SAMPLE:
	begin
	  stream3_pattern_disable = stream3_sample_event;
	end
      STREAM3_PATTERN_MERGED:
	begin
	  stream3_pattern_disable = stream3_merged_event;
	end
//      SIGMON_ENABLED:
//	begin
//	  stream3_pattern_disable = sigmon_enable_event;
//	end
      default: begin
	stream3_pattern_disable = 1'b0;
      end
    endcase
  end // always @ begin

  
// Stream select
  always @(*) begin
    // stream0:
    case (sigmon_stream0_pattern_ctrl1[27:24]) 
      NWP2SBU_STREAM:
	begin
	  stream0_vld = nwp2sbu_vld;
	  stream0_rdy = nwp2sbu_rdy;
	  stream0_tlast = nwp2sbu_tlast;
	  stream0_data = nwp2sbu_data;
	end
      SBU2CXP_STREAM:
	begin
	  stream0_vld = sbu2cxp_vld;
	  stream0_rdy = sbu2cxp_rdy;
	  stream0_tlast = sbu2cxp_tlast;
	  stream0_data = sbu2cxp_data;
	end
      CXP2SBU_STREAM:
	begin
	  stream0_vld = cxp2sbu_vld;
	  stream0_rdy = cxp2sbu_rdy;
	  stream0_tlast = cxp2sbu_tlast;
	  stream0_data = cxp2sbu_data;
	end
      SBU2NWP_STREAM:
	begin
	  stream0_vld = sbu2nwp_vld;
	  stream0_rdy = sbu2nwp_rdy;
	  stream0_tlast = sbu2nwp_tlast;
	  stream0_data = sbu2nwp_data;
	end


      // Sampling DDR read/write address, before and after the ddr_map_table
      // Utilizing the existing stream_pattern mechanism, originally added for network stream search.
      // tlast is enforced to '1 since the address spans a single stream flit.
      IK2MAP_DDR_AW:
	begin
	  stream0_vld = ik2map_axi4mm_aw_vld;
	  stream0_rdy = ik2map_axi4mm_aw_rdy;
	  stream0_tlast = 1'b1;
	  stream0_data = {192'h000000000000000000000000000000000000000000000000, ik2map_axi4mm_aw_addr};
	end
      SBU2MLX_DDR_AW:
	begin
	  stream0_vld = axi4mm_aw_vld;
	  stream0_rdy = axi4mm_aw_rdy;
	  stream0_tlast = 1'b1;
	  stream0_data = {192'h000000000000000000000000000000000000000000000000, sbu2mlx_axi4mm_aw_addr};
	end
      IK2MAP_DDR_AR:
	begin
	  stream0_vld = ik2map_axi4mm_ar_vld;
	  stream0_rdy = ik2map_axi4mm_ar_rdy;
	  stream0_tlast = 1'b1;
	  stream0_data = {192'h000000000000000000000000000000000000000000000000, ik2map_axi4mm_ar_addr};
	end
      SBU2MLX_DDR_AR:
	begin
	  stream0_vld = axi4mm_ar_vld;
	  stream0_rdy = axi4mm_ar_rdy;
	  stream0_tlast = 1'b1;
	  stream0_data = {192'h000000000000000000000000000000000000000000000000, sbu2mlx_axi4mm_ar_addr};
	end
      default: begin
	stream0_vld = 1'b0;
	stream0_rdy = 1'b0;
	stream0_tlast = 1'b0;
	stream0_data = 48'h000000000000;
      end
    endcase

    // stream1:
    case (sigmon_stream1_pattern_ctrl1[27:24]) 
      NWP2SBU_STREAM:
	begin
	  stream1_vld = nwp2sbu_vld;
	  stream1_rdy = nwp2sbu_rdy;
	  stream1_tlast = nwp2sbu_tlast;
	  stream1_data = nwp2sbu_data;
	end
      SBU2CXP_STREAM:
	begin
	  stream1_vld = sbu2cxp_vld;
	  stream1_rdy = sbu2cxp_rdy;
	  stream1_tlast = sbu2cxp_tlast;
	  stream1_data = sbu2cxp_data;
	end
      CXP2SBU_STREAM:
	begin
	  stream1_vld = cxp2sbu_vld;
	  stream1_rdy = cxp2sbu_rdy;
	  stream1_tlast = cxp2sbu_tlast;
	  stream1_data = cxp2sbu_data;
	end
      SBU2NWP_STREAM:
	begin
	  stream1_vld = sbu2nwp_vld;
	  stream1_rdy = sbu2nwp_rdy;
	  stream1_tlast = sbu2nwp_tlast;
	  stream1_data = sbu2nwp_data;
	end
      IK2MAP_DDR_AW:
	begin
	  stream1_vld = ik2map_axi4mm_aw_vld;
	  stream1_rdy = ik2map_axi4mm_aw_rdy;
	  stream1_tlast = 1'b1;
	  stream1_data = {192'h000000000000000000000000000000000000000000000000, ik2map_axi4mm_aw_addr};
	end
      SBU2MLX_DDR_AW:
	begin
	  stream1_vld = axi4mm_aw_vld;
	  stream1_rdy = axi4mm_aw_rdy;
	  stream1_tlast = 1'b1;
	  stream1_data = {192'h000000000000000000000000000000000000000000000000, sbu2mlx_axi4mm_aw_addr};
	end
      IK2MAP_DDR_AR:
	begin
	  stream1_vld = ik2map_axi4mm_ar_vld;
	  stream1_rdy = ik2map_axi4mm_ar_rdy;
	  stream1_tlast = 1'b1;
	  stream1_data = {192'h000000000000000000000000000000000000000000000000, ik2map_axi4mm_ar_addr};
	end
      SBU2MLX_DDR_AR:
	begin
	  stream1_vld = axi4mm_ar_vld;
	  stream1_rdy = axi4mm_ar_rdy;
	  stream1_tlast = 1'b1;
	  stream1_data = {192'h000000000000000000000000000000000000000000000000, sbu2mlx_axi4mm_ar_addr};
	end
      default: begin
	stream1_vld = 1'b0;
	stream1_rdy = 1'b0;
	stream1_tlast = 1'b0;
	stream1_data = 48'h000000000000;
      end
    endcase

    // stream2:
    case (sigmon_stream2_pattern_ctrl1[27:24]) 
      NWP2SBU_STREAM:
	begin
	  stream2_vld = nwp2sbu_vld;
	  stream2_rdy = nwp2sbu_rdy;
	  stream2_tlast = nwp2sbu_tlast;
	  stream2_data = nwp2sbu_data;
	end
      SBU2CXP_STREAM:
	begin
	  stream2_vld = sbu2cxp_vld;
	  stream2_rdy = sbu2cxp_rdy;
	  stream2_tlast = sbu2cxp_tlast;
	  stream2_data = sbu2cxp_data;
	end
      CXP2SBU_STREAM:
	begin
	  stream2_vld = cxp2sbu_vld;
	  stream2_rdy = cxp2sbu_rdy;
	  stream2_tlast = cxp2sbu_tlast;
	  stream2_data = cxp2sbu_data;
	end
      SBU2NWP_STREAM:
	begin
	  stream2_vld = sbu2nwp_vld;
	  stream2_rdy = sbu2nwp_rdy;
	  stream2_tlast = sbu2nwp_tlast;
	  stream2_data = sbu2nwp_data;
	end
      IK2MAP_DDR_AW:
	begin
	  stream2_vld = ik2map_axi4mm_aw_vld;
	  stream2_rdy = ik2map_axi4mm_aw_rdy;
	  stream2_tlast = 1'b1;
	  stream2_data = {192'h000000000000000000000000000000000000000000000000, ik2map_axi4mm_aw_addr};
	end
      SBU2MLX_DDR_AW:
	begin
	  stream2_vld = axi4mm_aw_vld;
	  stream2_rdy = axi4mm_aw_rdy;
	  stream2_tlast = 1'b1;
	  stream2_data = {192'h000000000000000000000000000000000000000000000000, sbu2mlx_axi4mm_aw_addr};
	end
      IK2MAP_DDR_AR:
	begin
	  stream2_vld = ik2map_axi4mm_ar_vld;
	  stream2_rdy = ik2map_axi4mm_ar_rdy;
	  stream2_tlast = 1'b1;
	  stream2_data = {192'h000000000000000000000000000000000000000000000000, ik2map_axi4mm_ar_addr};
	end
      SBU2MLX_DDR_AR:
	begin
	  stream2_vld = axi4mm_ar_vld;
	  stream2_rdy = axi4mm_ar_rdy;
	  stream2_tlast = 1'b1;
	  stream2_data = {192'h000000000000000000000000000000000000000000000000, sbu2mlx_axi4mm_ar_addr};
	end
      
      default: begin
	stream2_vld = 1'b0;
	stream2_rdy = 1'b0;
	stream2_tlast = 1'b0;
	stream2_data = 48'h000000000000;
      end
    endcase

    // stream3:
    case (sigmon_stream3_pattern_ctrl1[27:24]) 
      NWP2SBU_STREAM:
	begin
	  stream3_vld = nwp2sbu_vld;
	  stream3_rdy = nwp2sbu_rdy;
	  stream3_tlast = nwp2sbu_tlast;
	  stream3_data = nwp2sbu_data;
	end
      SBU2CXP_STREAM:
	begin
	  stream3_vld = sbu2cxp_vld;
	  stream3_rdy = sbu2cxp_rdy;
	  stream3_tlast = sbu2cxp_tlast;
	  stream3_data = sbu2cxp_data;
	end
      CXP2SBU_STREAM:
	begin
	  stream3_vld = cxp2sbu_vld;
	  stream3_rdy = cxp2sbu_rdy;
	  stream3_tlast = cxp2sbu_tlast;
	  stream3_data = cxp2sbu_data;
	end
      SBU2NWP_STREAM:
	begin
	  stream3_vld = sbu2nwp_vld;
	  stream3_rdy = sbu2nwp_rdy;
	  stream3_tlast = sbu2nwp_tlast;
	  stream3_data = sbu2nwp_data;
	end
      IK2MAP_DDR_AW:
	begin
	  stream3_vld = ik2map_axi4mm_aw_vld;
	  stream3_rdy = ik2map_axi4mm_aw_rdy;
	  stream3_tlast = 1'b1;
	  stream3_data = {192'h000000000000000000000000000000000000000000000000, ik2map_axi4mm_aw_addr};
	end
      SBU2MLX_DDR_AW:
	begin
	  stream3_vld = axi4mm_aw_vld;
	  stream3_rdy = axi4mm_aw_rdy;
	  stream3_tlast = 1'b1;
	  stream3_data = {224'h00000000000000000000000000000000000000000000000000000000, sbu2mlx_axi4mm_aw_addr};
	end
      IK2MAP_DDR_AR:
	begin
	  stream3_vld = ik2map_axi4mm_ar_vld;
	  stream3_rdy = ik2map_axi4mm_ar_rdy;
	  stream3_tlast = 1'b1;
	  stream3_data = {192'h000000000000000000000000000000000000000000000000, ik2map_axi4mm_ar_addr};
	end
      SBU2MLX_DDR_AR:
	begin
	  stream3_vld = axi4mm_ar_vld;
	  stream3_rdy = axi4mm_ar_rdy;
	  stream3_tlast = 1'b1;
	  stream3_data = {224'h00000000000000000000000000000000000000000000000000000000, sbu2mlx_axi4mm_ar_addr};
	end
      default: begin
	stream3_vld = 1'b0;
	stream3_rdy = 1'b0;
	stream3_tlast = 1'b0;
	stream3_data = 48'h000000000000;
      end
    endcase

  end // always @ begin

  wire stream0_sample_internal_event;
  wire stream0_match_internal_event;
  wire stream1_sample_internal_event;
  wire stream1_match_internal_event;
  wire stream2_sample_internal_event;
  wire stream2_match_internal_event;
  wire stream3_sample_internal_event;
  wire stream3_match_internal_event;
  
sigmon_pattern stream0_pattern (
.clk(clk),
.reset(sigmon_reset),
.stream_vld(stream0_vld),
.stream_rdy(stream0_rdy),
.stream_last(stream0_tlast),
.stream_data(stream0_data),
.pattern_enable(stream0_pattern_enable),
.pattern_disable(stream0_pattern_disable),
.pattern_ctrl(sigmon_stream0_pattern_ctrl1),
.pattern_h(sigmon_stream0_pattern_h),
.pattern_l(sigmon_stream0_pattern_l),
.sample_data_out(stream0_sample_data),
.sample_event_out(stream0_sample_event),
.match_event_out(stream0_match_event),
.sample_internal_event_out(stream0_sample_internal_event),
.match_internal_event_out(stream0_match_internal_event),
.stream0_sample(stream0_sample_internal_event),
.stream0_match(stream0_match_internal_event),
.stream1_sample(stream1_sample_internal_event),
.stream1_match(stream1_match_internal_event),
.stream2_sample(stream2_sample_internal_event),
.stream2_match(stream2_match_internal_event),
.stream3_sample(stream3_sample_internal_event),
.stream3_match(stream3_match_internal_event),
.merged_event_out(stream0_merged_event)
 );

sigmon_pattern stream1_pattern (
.clk(clk),
.reset(sigmon_reset),
.stream_vld(stream1_vld),
.stream_rdy(stream1_rdy),
.stream_last(stream1_tlast),
.stream_data(stream1_data),
.pattern_enable(stream1_pattern_enable),
.pattern_disable(stream1_pattern_disable),
.pattern_ctrl(sigmon_stream1_pattern_ctrl1),
.pattern_h(sigmon_stream1_pattern_h),
.pattern_l(sigmon_stream1_pattern_l),
.sample_data_out(stream1_sample_data),
.match_event_out(stream1_match_event),
.sample_event_out(stream1_sample_event),
.sample_internal_event_out(stream1_sample_internal_event),
.match_internal_event_out(stream1_match_internal_event),
.stream0_sample(stream0_sample_internal_event),
.stream0_match(stream0_match_internal_event),
.stream1_sample(stream1_sample_internal_event),
.stream1_match(stream1_match_internal_event),
.stream2_sample(stream2_sample_internal_event),
.stream2_match(stream2_match_internal_event),
.stream3_sample(stream3_sample_internal_event),
.stream3_match(stream3_match_internal_event),
.merged_event_out(stream1_merged_event)
 );
  
sigmon_pattern stream2_pattern (
.clk(clk),
.reset(sigmon_reset),
.stream_vld(stream2_vld),
.stream_rdy(stream2_rdy),
.stream_last(stream2_tlast),
.stream_data(stream2_data),
.pattern_enable(stream2_pattern_enable),
.pattern_disable(stream2_pattern_disable),
.pattern_ctrl(sigmon_stream2_pattern_ctrl1),
.pattern_h(sigmon_stream2_pattern_h),
.pattern_l(sigmon_stream2_pattern_l),
.sample_data_out(stream2_sample_data),
.match_event_out(stream2_match_event),
.sample_event_out(stream2_sample_event),
.sample_internal_event_out(stream2_sample_internal_event),
.match_internal_event_out(stream2_match_internal_event),
.stream0_sample(stream0_sample_internal_event),
.stream0_match(stream0_match_internal_event),
.stream1_sample(stream1_sample_internal_event),
.stream1_match(stream1_match_internal_event),
.stream2_sample(stream2_sample_internal_event),
.stream2_match(stream2_match_internal_event),
.stream3_sample(stream3_sample_internal_event),
.stream3_match(stream3_match_internal_event),
.merged_event_out(stream2_merged_event)
 );

sigmon_pattern stream3_pattern (
.clk(clk),
.reset(sigmon_reset),
.stream_vld(stream3_vld),
.stream_rdy(stream3_rdy),
.stream_last(stream3_tlast),
.stream_data(stream3_data),
.pattern_enable(stream3_pattern_enable),
.pattern_disable(stream3_pattern_disable),
.pattern_ctrl(sigmon_stream3_pattern_ctrl1),
.pattern_h(sigmon_stream3_pattern_h),
.pattern_l(sigmon_stream3_pattern_l),
.sample_data_out(stream3_sample_data),
.match_event_out(stream3_match_event),
.sample_event_out(stream3_sample_event),
.sample_internal_event_out(stream3_sample_internal_event),
.match_internal_event_out(stream3_match_internal_event),
.stream0_sample(stream0_sample_internal_event),
.stream0_match(stream0_match_internal_event),
.stream1_sample(stream1_sample_internal_event),
.stream1_match(stream1_match_internal_event),
.stream2_sample(stream2_sample_internal_event),
.stream2_match(stream2_match_internal_event),
.stream3_sample(stream3_sample_internal_event),
.stream3_match(stream3_match_internal_event),
.merged_event_out(stream3_merged_event)
 );
  
endmodule
