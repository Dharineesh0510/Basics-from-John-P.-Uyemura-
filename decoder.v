module decoder_2_to_4 (
    input s_1,
    input s_0,
    output d0,
    output d1,
    output d2,
    output d3
);

    // Internal wires for the inverted inputs
    wire s_1_n, s_0_n;

    // NOT gates have a 1-unit time delay
    not #(1) not_s1 (s_1_n, s_1);
    not #(1) not_s0 (s_0_n, s_0);

    // AND gates have a 2-unit time delay
    and #(2) and0 (d0, s_1_n, s_0_n);
    and #(2) and1 (d1, s_1_n, s_0);
    and #(2) and2 (d2, s_1, s_0_n);
    and #(2) and3 (d3, s_1, s_0);

endmodule
