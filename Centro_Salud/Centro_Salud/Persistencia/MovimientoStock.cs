///////////////////////////////////////////////////////////
//  MovimientoStock.cs
//  Implementation of the Class MovimientoStock
//  Generated by Enterprise Architect
//  Created on:      14-ene-2014 21:36:22
///////////////////////////////////////////////////////////


using System;

public class MovimientoStock {

	private DateTime fecha;
	private int nroMovimiento;
	public DetalleMovimiento m_DetalleMovimiento;
	public TipoMovimiento m_TipoMovimiento;
	public Comprobante m_Comprobante;

	public MovimientoStock(){

	}

	~MovimientoStock(){

	}

	public virtual void Dispose(){

	}

}//end MovimientoStock