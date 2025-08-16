module tb_decoder;

    // Declare registers (reg) to drive the inputs of the decoder
    reg  s1_tb;
    reg  s0_tb;

    // Declare wires (wire) to capture the outputs from the decoder
    wire d0_tb;
    wire d1_tb;
    wire d2_tb;
    wire d3_tb;

    // Instantiate the design under test (DUT)
    // Connect the testbench's regs and wires to the decoder's ports
    decoder_2_to_4 uut (
        .s_1(s1_tb),
        .s_0(s0_tb),
        .d0(d0_tb),
        .d1(d1_tb),
        .d2(d2_tb),
        .d3(d3_tb)
    );

    // This initial block contains the simulation stimulus
    initial begin
        // 1. Setup waveform dumping
        $dumpfile("decoder_waveform.vcd"); // Set the name of the output waveform file
        $dumpvars(0, tb_decoder);          // Tell the simulator to dump all signals in this module

        // 2. Apply input stimuli
        // Hold each input combination for 20 ns to clearly see the results
        s1_tb = 0; s0_tb = 0; // Test case 00
        #50;

        s1_tb = 0; s0_tb = 1; // Test case 01
        #50;

        s1_tb = 1; s0_tb = 0; // Test case 10
        #50;

        s1_tb = 1; s0_tb = 1; // Test case 11
        #50;

        // 3. End the simulation
        $finish;
    end

endmodule
