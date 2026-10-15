function unsetmvncl
     mv ~/.m2/settings.xml ~/.m2/settings.xml.bak
     cat ~/.m2/settings.xml
end

function setmvncl
     mv ~/.m2/settings.xml.bak ~/.m2/settings.xml
     cat ~/.m2/settings.xml
end
