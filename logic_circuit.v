module LogicCircuit (
    input a, b, c, d,      
    output F1, F2     
);

    wire w1;
    nor g1 (F1, a, b);
    and g2 (w1, a, b, c);
    and g3 (F2, w1, d);

endmodule
