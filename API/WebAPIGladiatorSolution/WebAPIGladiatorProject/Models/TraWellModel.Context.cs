﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WebAPIGladiatorProject.Models
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class TraWellDummyEntities : DbContext
    {
        public TraWellDummyEntities()
            : base("name=TraWellDummyEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Admin> Admins { get; set; }
        public virtual DbSet<Booking> Bookings { get; set; }
        public virtual DbSet<Bus> Buses { get; set; }
        public virtual DbSet<GuestUser> GuestUsers { get; set; }
        public virtual DbSet<PassengerDetail> PassengerDetails { get; set; }
        public virtual DbSet<Place> Places { get; set; }
        public virtual DbSet<Route> Routes { get; set; }
        public virtual DbSet<Stop> Stops { get; set; }
        public virtual DbSet<Transaction> Transactions { get; set; }
        public virtual DbSet<Trip> Trips { get; set; }
        public virtual DbSet<TripStop> TripStops { get; set; }
        public virtual DbSet<User> Users { get; set; }
    }
}