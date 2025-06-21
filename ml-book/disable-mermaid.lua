-- disable-mermaid.lua
-- This filter intercepts mermaid code blocks and prevents Quarto's default processing.
-- It transforms the block into a raw HTML div with the class "mermaid",
-- which can then be rendered by the manually included Mermaid.js library.
function CodeBlock(el)
  if el.classes:includes("mermaid") then
    -- Create a visible diagnostic message
    local diagnostic_msg = '<h1>LUA FILTER IS WORKING!</h1>'
    -- Create the mermaid div
    local mermaid_div = '<div class="mermaid">' .. el.text .. '</div>'
    -- Return both as raw HTML
    return pandoc.RawBlock("html", diagnostic_msg .. mermaid_div)
  end
end 