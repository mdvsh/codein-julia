using Dashboards, PlotlyJS, DataFrames, HTTP, CSV, JSON, DataFramesMeta

external_stylesheets = ["https://codepen.io/chriddyp/pen/bWLwgP.css"]
println("downloading data for the graph....")

df = CSV.read(HTTP.get("https://gist.githubusercontent.com/PseudoCodeNerd/c657a47ff534347e4b5491666bc7199e/raw/7abe5446c86d56bf20422931a0abba88d03daed7/data.csv").body)
delete!(df, :Column1)#removing column of serial numbers
city_lis = names(df)
deleteat!(city_lis, 1)

color_lis = ["Greens", "YlOrRd", "Bluered", "RdBu", "Reds", "Blues", "Picnic", "Rainbow", "Portland", "Jet", "Hot","Blackbody", "Earth", "Electric", "Viridis", "Cividis"]

#trying to implement this colorscale plot, previously done with python and dash for official documentation.
#https://github.com/plotly/simple-example-chart-apps/tree/master/dash-colorscaleplot
#working example here : https://dash-simple-apps.plotly.host/dash-colorscaleplot/

app = Dash("Dash Layout", external_stylesheets=external_stylesheets) do
    html_div(className = "container") do
        dcc_graph(id = "my-graph"),
        html_div() do
            html_h1("New Zealand Rainfall",
            style=(
                textAlign="center",
                fontFamily = "Helvetica",
                fontSize = "45px",
                color = "#323232",
                fontWeight = "300"
                )
            ),

            html_div(style = (width="30%", float="left")) do
                html_span("Choose City",
                style=(
                        fontSize = "18px",
                        fontFamily = "Helvetica",
                    )
                ),
                dcc_dropdown(
                    id ="selected-city",
                    value = "Auckland",
                    options = [(label = i, value = i) for i in city_lis] 
                )
            end,
            
            html_div(style = (width="30%" , float="right")) do
                html_span("Choose Colorscale",
                style=(
                        fontSize = "18px",
                        fontFamily = "Helvetica",
                    )
                ),
                dcc_dropdown(
                    id ="selected-color",
                    value = "Blackbody",
                    options = [(label = i, value = i) for i in color_lis] 
                )
            end

        end
               
    end
end


#callback !!!
callback!(app, callid"selected-city.value => my-graph.figure") do selected 
    Plot(
        df,
        Layout(
            xaxis_title = "Date",
            yaxis_title = "Rainfall (mm)",
            yaxis_range = [0,350],
            yaxis_showline = true,
            paper_bgcolor = "#000000",
            plot_bgcolor = "#000000",
            font_color = "#ffffff"
        ),
        kind = scatter,
        x = df["DATE"],
        y = df[selected],
        mode = "markers",
        marker_size = 10,
        name = selected,
        line_width = 4
    )
end


handler = make_handler(app, debug = true)
println("started at localhost:8080")
HTTP.serve(handler, HTTP.Sockets.localhost, 8080)