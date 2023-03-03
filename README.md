<!-- TABLE OF CONTENTS -->
<h3>
  <details>
    <summary>Table of Contents</summary>
    <ol>
      <li>
        <a href="#about-the-project">About The Project</a>
        <ul>
          <li><a href="#built-with">Built With</a></li>
          <li><a href="#database-schema">Database Schema</a></li>
        </ul>
      </li>
      <li>
        <a href="#getting-started">Getting Started</a>
        <ul>
            <li><a href="#repository">Repository</a></li>
            <li><a href="#repository-installation">Repository Installation</a></li>
            <li><a href="#endpoints">Endpoints</a></li>
        </ul>
      </li>
      <li><a href="#roadmap">Roadmap</a></li>
      <li><a href="#contact">Contact</a></li>
      <li><a href="#acknowledgments">Acknowledgments</li>
    </ol>
  </details>
</h3>

<!-- ABOUT THE PROJECT -->
## About The Project

Hot Tea at Your Service is a school project at Turing School of software and design with the goal of learning and practicing the following:
1. Emulating a take home assignment from an interview
2. Creating/Revising creating a RESTful api
3. Giving Students the opportunity to practice speaking technically about a project and defending design decisions
<br />
It is an api service built to allow a FE to create, cancel, and get customer tea subscriptions!

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- Built With -->
### Built With

Hot Tea at Your service is a Rails web API application that does not consume any external API

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- Database Schema -->
### Database Schema

Hot Tea at Your Service utilizes a many-to-many relationship where a customers table is joined to a teas table via a subscriptions join table

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- GETTING STARTED -->
## Getting Started

Hot Tea at Your Service is not meant to be a standalone application; it is built to meet specifically the needs of imaginary frontend developers as mentioned in the about section. 

<!-- Repository -->
### Repository

If by some happenstance you're uncertain how you got to this repo, here's the link:
* [https://github.com/msakr21/hot_tea_at_your_service] <br />

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- Repository Installation -->
### Repository Installation
<b>Gem Installation</b>
* `bundle install`

<b>DB Creation</b>
* `rails db:{drop,create,migrate}`

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- Endpoints -->
### Endpoints

As of the most recent PR, this API has 6 endpoints:<br />
1. post '/api/v1/subscriptions' which allows a customer to create a subscription
2. get '/api/v1/subscriptions' which returns a list of custom subscriptions
3. patch '/api/v1/subcriptions' which allows a customer to cancel a subscription
<br />

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- ROADMAP -->
## Roadmap

MVP
* [x] Set up POST '/api/v1/subscriptions'
* [x] Set up PATCH '/api/v1/subscriptions'
* [x] Set up GET '/api/v1/subscriptions'

Stretch Goals
* [x] None

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- CONTACT -->
## Contact

<table>
  <tr>
    <td><img src="https://avatars.githubusercontent.com/u/110377741?s=150&v=4" width='150'></td>
  </tr>
  <tr>
    <td>Mostafa Sakr</td>
  </tr>
  <tr>
    <td>
      <a href="https://github.com/msakr21">GitHub</a><br>
      <a href="https://www.linkedin.com/in/mostafa-sakr-4bb722250">LinkedIn</a>
    </td>
  </tr>
</table>

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

Turing School of Software Design: [https://turing.edu/](https://turing.edu/)

<p align="right">(<a href="#top">back to top</a>)</p>
