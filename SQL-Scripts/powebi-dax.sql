================================================
PROJECT : Mobile Phone Sales Analysis

TOOL    : Power BI Desktop
================================================

HOW TO ADD THESE MEASURES IN POWER BI:
  Home > New Measure > paste the formula > Enter


------------------------------------------------
SECTION 1 : BASIC MEASURES  (add these first)
------------------------------------------------

Total Revenue =
    SUM( sales_clean[Final_Revenue] )

Total Orders =
    COUNTROWS( sales_clean )

Average Order Value =
    DIVIDE( [Total Revenue], [Total Orders] )

Average Rating =
    AVERAGE( sales_clean[Rating] )

Total Discount Given =
    SUM( sales_clean[Discount_Amt] )


------------------------------------------------
SECTION 2 : PERCENTAGE MEASURES
------------------------------------------------

-- What % of revenue each brand contributes
Brand Revenue % =
    DIVIDE(
        SUM( sales_clean[Final_Revenue] ),
        CALCULATE( SUM( sales_clean[Final_Revenue] ), ALL( sales_clean[Brand] ) )
    )

-- What % of revenue each state contributes
State Revenue % =
    DIVIDE(
        SUM( sales_clean[Final_Revenue] ),
        CALCULATE( SUM( sales_clean[Final_Revenue] ), ALL( sales_clean[State] ) )
    )


------------------------------------------------
SECTION 3 : RANKING MEASURE
------------------------------------------------

-- Rank brands 1 to 5 by revenue (1 = highest)
Brand Rank =
    RANKX(
        ALL( sales_clean[Brand] ),
        [Total Revenue],
        ,
        DESC
    )


------------------------------------------------
SECTION 4 : KPI STATUS LABEL
------------------------------------------------

-- Shows "Good" / "Average" based on rating
Rating Label =
    IF( [Average Rating] >= 4.0, "Good ✓", "Average" )


================================================
POWER BI DASHBOARD — 5 PAGES
================================================

-----------------------------
PAGE 1 : OVERVIEW
-----------------------------
Visuals to add:
  • 4 KPI Cards  → Total Revenue | Total Orders | Avg Order Value | Avg Rating
  • Line Chart   → X: Order_Date (Month)  |  Y: Total Revenue
  • Bar Chart    → X: Brand  |  Y: Total Revenue  |  Color: Brand
  • Donut Chart  → Legend: Category  |  Values: Total Revenue

Slicers (add on left side):
  • Brand       → Dropdown
  • Category    → Tile / Button
  • State       → Dropdown
  • Order Date  → Date range

-----------------------------
PAGE 2 : BRAND ANALYSIS
-----------------------------
Visuals:
  • Clustered Bar  → Brand vs Revenue + Orders (dual axis)
  • Table          → Brand | Orders | Revenue | Avg Rating | Rank
  • Bar Chart      → Top 10 Models by Revenue

-----------------------------
PAGE 3 : STATE / GEOGRAPHY
-----------------------------
Visuals:
  • Filled Map  → Location: State  |  Color: Total Revenue
                  (Power BI auto-detects India states)
  • Bar Chart   → State vs Revenue (sorted high to low)
  • Table       → State | Orders | Revenue | State Revenue %

-----------------------------
PAGE 4 : PAYMENT & DISCOUNT
-----------------------------
Visuals:
  • Donut Chart  → Legend: Payment_Mode  |  Values: Total Orders
  • Bar Chart    → Brand vs Avg Discount %
  • Card         → Total Discount Given
  • Table        → Payment_Mode | Orders | Revenue

-----------------------------
PAGE 5 : MONTHLY TREND
-----------------------------
Visuals:
  • Line Chart   → Month vs Revenue  (add trend line)
  • Bar Chart    → Month vs Orders
  • Table        → Month | Orders | Revenue

  Tip: Right-click Order_Date → create Date Hierarchy
       Then drag "Month" to X axis


================================================
REPORT THEME (copy into Power BI format/theme)
================================================
  Background colour : #FFFFFF  (white)
  Primary colour    : #1F4E79  (dark blue)
  Accent colour     : #2E75B6  (medium blue)
  Font              : Segoe UI
  Canvas size       : 1280 x 720


================================================
STEP-BY-STEP: CONNECT DATA IN POWER BI
================================================
1. Open Power BI Desktop
2. Home > Get Data > Text/CSV
3. Select your sales_clean export (or connect SQL Server directly)
4. Click Load
5. Go to Model view > set Order_Date as Date type
6. Add all measures from Section 1 and 2 above
7. Build pages one by one using the page guide above
