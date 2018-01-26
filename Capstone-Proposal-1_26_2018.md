Capstone Project Proposal
================
Maria Leite
January 26, 2018

### 1. Introduction

-   **What is the problem you want to solve?**

The domain of the project is water pump operation and management. The project has a goal of developing a smart data science based framework that allow the prediction of which water pumps are functional, which need some repairs, and which don't work at all. The basis for developing the framework is the analysis of the data provided by Taarifa and the Tanzanian Ministry of Water. This is a classification problem: predict one of the three classes (functional, needs repair, unoperational) based on a number of variables (features) such as kind of pump that is operating, when it was installed, and how it is managed. \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_

-   **Who is your client and why do they care about this problem?** In other words, what will your client DO or DECIDE based on your analysis that they wouldn't have otherwise?\*\*

The client is Tanzanian Ministry of Water. The results of the data analysis and the Smart Data Science framework developed will enable a better understanding of which waterpoints will fail and aid on designing a more efficient maintenance plan operations. The broad impact consists optimize resources to ensuring that clean, potable water is available to communities across Tanzania. This is a critical task for a region where poverty is high, resources are limited and water supply has been a challenge. It is widely accepted that the challenges of managing water supply worldwide, and in particular in this region, will increase due to climate change.

### 2. Materials

-   **What data are you going to use for this? How will you acquire this data?** \*

The project will use a sample of the data provided by Taarifa and the Tanzanian Ministry of Water, which is part of a competition entitled "Pump it Up: Data Mining the Water Table", hosted by Y DRIVENDATA (<https://www.drivendata.org/competitions/7/pump-it-up-data-mining-the-water-table/>)

**The features in the dataset**

The following set of information about the waterpointsare are provided:

             -  amount_tsh: Total static head (amount water available to waterpoint)
             -  date_recorded: The date the row was entered
             -  funder: Who funded the well
             -  gps_height: Altitude of the well
             -  installer: Organization that installed the well
             -  longitude: GPS coordinate
             -  latitude: GPS coordinate
             -  wpt_name: Name of the waterpoint if there is one
             -  num_private -
             -  basin: Geographic water basin
             -  subvillage: Geographic location
             -  region: Geographic location
             -  region_code: Geographic location (coded)
             -  district_code: Geographic location (coded)
             -  lga: Geographic location
             -  ward: Geographic location
             -  population: Population around the well
             -  public_meeting: True/False
             -  recorded_by: Group entering this row of data
             -  scheme_management: Who operates the waterpoint
             -  scheme_name: Who operates the waterpoint
             -  permit: If the waterpoint is permitted
             -  construction_year: Year the waterpoint was constructed
             -  extraction_type: The kind of extraction the waterpoint uses
             -  extraction_type_group: The kind of extraction the waterpoint uses
             -  extraction_type_class: The kind of extraction the waterpoint uses
             -  management: How the waterpoint is managed
             -  management_group: How the waterpoint is managed
             -  payment: What the water costs
             -  payment_type: What the water costs
             -  water_quality: The quality of the water
             -  quality_group: The quality of the water
             -  quantity: The quantity of water
             -  quantity_group: The quantity of water
             -  source: The source of the water
             -  source_type: The source of the water
             -  source_class: The source of the water
             -  waterpoint_type: The kind of waterpoint
             -  waterpoint_type_group: The kind of waterpoint

The possible distribution of Labels (outcomes) are:

            -   functional: the waterpoint is operational and there are no repairs needed
            -   functional needs repair: the waterpoint is operational, but needs repairs
            -   non functional: the waterpoint is not operational

### 3. Methods

-   **In brief, outline your approach to solving this problem (knowing that this might change later).**

We will use supervised classification, also called supervised learning. This is the machine learning task of inferring a function from labeled training data. The training data consist of a set of training examples. In supervised learning, each example is a pair consisting of an input object (typically a vector) and a desired output value (also called label, class or category). A supervised learning algorithm analyzes the training data and produces an inferred function, which can be used for mapping new examples. An optimal scenario will allow for the algorithm to correctly determine the class labels for unseen instances.

The first task is to use R and Data Wrangling techniques to explore the data so to identify: a) Select the features to be used based on knowledge domain, and hypothesis derived directly from data observation b) the most adequate classification techniques that can be used and c) the data manipulations that need to be performed before applying the methods identified in a).

Then, test the different classification techniques / algorithms to select the most efficient using a subset of data sample mentioned above. Most likely this step will be an iterative process and will be performed using R. The identified classification technique will be applied to the whole data sample.

### 4. Results

-   **What are your deliverables? Typically, this would include code, along with a paper and/or a slide deck.**

The possible deliveries are codes along with a paper
