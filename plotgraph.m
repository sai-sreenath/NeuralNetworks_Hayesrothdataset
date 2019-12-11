function []= plotgraph(hyperplane, legendText)
    m=-1*(hyperplane(2)/hyperplane(3));
    b=-1*(hyperplane(1)/hyperplane(3));
    x=10*(rand(1,50)-0.5);
    y=m*x+b;
    
    if legendText=="Target hyperplane"
        plot(x,y,'v','DisplayName',legendText,'LineWidth',2);
    else
        plot(x,y,'DisplayName',legendText);
    grid;
    hold on;
end
