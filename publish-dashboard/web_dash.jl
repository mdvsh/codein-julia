# Dashboards implementation of example from Dash Tutorial (section Basic Dash Callbacks) (https://dash.plot.ly/getting-started-part-2)
# Original By Waralex
# Modified for deplotment by PseudoCodeNerd

import HTTP, CSV, JSON
using Dashboards, PlotlyJS, DataFrames

external_stylesheets = ["https://codepen.io/chriddyp/pen/bWLwgP.css"]
println("Getting Data.....")
df = CSV.read(
        HTTP.get("https://raw.githubusercontent.com/plotly/" *
        "datasets/master/gapminderDataFiveYear.csv").body
    )

app = Dash("Dash Layout", external_stylesheets=external_stylesheets) do
    html_div() do
        html_h2("Life Expectancies in Continents",
        style=(
            textAlign="center",
            fontFamily = "Helvetica",
            fontSize = "45px",
            color = "#323232",
            fontWeight = "300"
            )
        ),
        html_h4("This Dashboard is deployed with Heroku. Learn how to do it at blog.madhavsharma.me",
        style=(textAlign="center",
        fontFamily = "Montserrat, Roboto",
        color = "#323232")
        ),

        dcc_graph(id = "graph-with-slider"),        
        dcc_slider(
            id = "year-slider",
            min = minimum(df[:,:year]),
            max = maximum(df[:,:year]),
            value = minimum(df[:,:year]),
            marks = Dict([Symbol(v)=>Symbol(v) for v in unique(df[:,:year])]),
            step = nothing
            ),
        html_p("Source : https://github.com/waralex/DashboardsExamples/blob/master/dash_tutorial/3_basic_dash_callbacks_2.jl#L23",
        style = (textAlign = "center", paddingTop = "40px", color = "#323232")
        )
    end
end

callback!(app, callid"year-slider.value => graph-with-slider.figure") do selected_year
    Plot(
        df[df.year .== selected_year, :],
        Layout(
            xaxis_type = "log",
            xaxis_title = "GDP Per Capita",
            yaxis_title = "Life Expectancy",
            legend_x = 0,
            legend_y = 1,
            hovermode = "closest"
        ),
        x=:gdpPercap,
        y=:lifeExp, 
        text = :country,
        mode="markers",
        group=:continent,
        marker_size = 15,
        marker_line_width = 0.5,
        marker_line_color = "white"         
    )
end

handler = make_handler(app, debug = false)
println("started at localhost:$(parse(Int, ARGS[1]))")
HTTP.serve(handler,"0.0.0.0",parse(Int,ARGS[1]))
