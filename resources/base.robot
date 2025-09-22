*** Settings ***

Library        Browser

*** Keywords ***

Start Session
    
    New Browser        browser=chromium        headless=False
    New Page           https://compassuolfront.serverest.dev/