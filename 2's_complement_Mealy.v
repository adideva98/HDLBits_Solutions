module top_module (
    input clk,
    input areset,
    input x,
    output z
); 
    parameter A=0,B=1;
    reg state,next_state;
    always@(*)
        case(state)
            A:next_state<=(x==1)?B:A;
            B:next_state<=B;
        endcase
    always @(posedge clk, posedge areset)
        begin
            if(areset)
                state<=A;
            else
                state<=next_state;
        end
    always @(*)
        case(state)
            A:z<=(x==1)?1:0;
            B:z<=(x==1)?0:1;
        endcase

endmodule
